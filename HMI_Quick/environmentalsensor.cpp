//File: environmentalsensor.cpp
//Description: EnvironmentalSensor definition

#include "environmentalsensor.h"

Environmentalsensor::Environmentalsensor(QObject *parent)
    : QObject(parent), m_timer(new QTimer(this))
{

    setUp();
    connect(m_timer, &QTimer::timeout, this, &Environmentalsensor::readData);
    m_timer->setInterval(EnvironmentalSensor_MSEC);
    m_timer->start();
}

qreal Environmentalsensor::getTemperature() const
{
    return m_temperature;
}

qreal Environmentalsensor::getPressure() const
{
    return m_pressure;
}

qreal Environmentalsensor::getHumidity() const
{
    return m_humidity;
}

void Environmentalsensor::stop()
{
    m_timer->stop();
}

/**
 * The function sets up the I2C connection to the BME280 sensor and reads the calibration data from the
 * sensor
 */
void Environmentalsensor::setUp()
{
    fd = wiringPiI2CSetup(BME280_ADDRESS);
    if(fd < 0) {
      std::cerr<<("Device not found");
      exit(EXIT_FAILURE);
    }
    readCalibrationData(fd, &cal);
}

/**
 * The function reads the data from the sensor and emits the signals for the QML to read
 */
void Environmentalsensor::readData()
{
    wiringPiI2CWriteReg8(fd, 0xf2, 0x01);   // humidity oversampling x 1
    wiringPiI2CWriteReg8(fd, 0xf4, 0x25);   // pressure and temperature oversampling x 1, mode normal

    bme280_raw_data raw;
    getRawData(fd, &raw);

    int32_t t_fine = getTemperatureCalibration(&cal, raw.temperature);
    m_temperature = compensateTemperature(t_fine);  //C
    m_pressure = compensatePressure(raw.pressure, &cal, t_fine) / 1000; // hPa
    m_humidity = compensateHumidity(raw.humidity, &cal, t_fine);       // %



    emit temperatureChanged();
    emit pressureChanged();
    emit humidityChanged();


    qDebug()<< Q_FUNC_INFO << m_temperature;
    qDebug()<< Q_FUNC_INFO << m_pressure;
    qDebug()<< Q_FUNC_INFO << m_humidity;
}
