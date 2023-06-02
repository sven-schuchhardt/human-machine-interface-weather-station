#include "simulatedata.h"

SimulateData::SimulateData(QObject *parent)
    : QObject(parent), m_timer(new QTimer(this))
{
    setUp();
    connect(m_timer, &QTimer::timeout, this, &SimulateData::simulateData);
    m_timer->setInterval(SimulateSensor_MSEC);
    m_timer->start();
}

qreal SimulateData::getTemperature() const
{
    return m_temperature;
}

qreal SimulateData::getPressure() const
{
    return m_pressure;
}

qreal SimulateData::getHumidity() const
{
    return m_humidity;
}

qreal SimulateData::getLight() const
{
    return m_light;
}
void SimulateData::stop()
{
    m_timer->stop();
}

void SimulateData::setUp()
{
    srand((unsigned) time(NULL));
}

/**
 * It generates random data and emits signals to notify the QML UI that the data has changed
 */
void SimulateData::simulateData()
{
    m_temperature = 20 + (rand() % 6);
    m_pressure = (1000 + (rand() % 50)) / 100;
    m_humidity = 40 + (rand() % 20);
    b_light = (rand() % 1);

    if(b_light == 1){
        m_light = true;
    } else {
        m_light = false;
    }

    emit temperatureChanged();
    emit pressureChanged();
    emit humidityChanged();
    emit lightChanged();


    qDebug()<< Q_FUNC_INFO << m_temperature;
    qDebug()<< Q_FUNC_INFO << m_pressure;
    qDebug()<< Q_FUNC_INFO << m_humidity;
    qDebug()<< Q_FUNC_INFO << m_light;
}
