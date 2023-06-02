#include "lightsensor.h"

LightSensor::LightSensor(QObject *parent):QObject(parent), m_timer(new QTimer(this))
{
    setUp();
    connect(m_timer, &QTimer::timeout, this, &LightSensor::readData);
    m_timer->setInterval(LightSensor_MSEC);
    m_timer->start();
}

bool LightSensor::getLight() const
{
    return !m_light;
}

void LightSensor::stop()
{
    m_timer->stop();
}

/**
 * This function sets up the wiringPi library and sets the pin mode to input
 */
void LightSensor::setUp()
{
    wiringPiSetup();
    pinMode(4, INPUT);
}

/**
 * The function reads the data from the light sensor and emits a signal to the QML file
 */
void LightSensor::readData()
{
    m_light = digitalRead(4);
    emit lightChanged();
    qDebug()<<Q_FUNC_INFO << m_light;
}
