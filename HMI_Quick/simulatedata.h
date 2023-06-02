#ifndef SIMULATEDATA_H
#define SIMULATEDATA_H

#include <QObject>
#include <QDebug>
#include <iostream>
#include <wiringPiI2C.h>
#include <bme280.h>

#include "generalsensor.h"

static const int SimulateSensor_MSEC = 1000;

class QTimer;

class SimulateData : public QObject
{
    Q_OBJECT

    Q_PROPERTY(qreal temperature READ getTemperature NOTIFY temperatureChanged);
    Q_PROPERTY(qreal pressure READ getPressure NOTIFY pressureChanged);
    Q_PROPERTY(qreal humidity READ getHumidity NOTIFY humidityChanged);


public:
    explicit SimulateData(QObject *parent = nullptr);
    qreal getTemperature() const;
    qreal getPressure() const;
    qreal getHumidity() const;
    qreal getLight() const;
    Q_INVOKABLE void stop();

signals:
    void temperatureChanged();
    void pressureChanged();
    void humidityChanged();
    void lightChanged();

private:
    void setUp();
    void simulateData();
    float m_temperature, m_pressure, m_humidity, b_light;
    bool m_light;
    QTimer * m_timer;
};

#endif // SIMULATEDATA_H
