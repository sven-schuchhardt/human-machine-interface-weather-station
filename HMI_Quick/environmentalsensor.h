//File: environmentalsensor.h
//Description: EnvironmentalSensor class definition

#ifndef ENVIRONMENTALSENSOR_H
#define ENVIRONMENTALSENSOR_H

#include <QObject>
#include <QDebug>
#include <iostream>
#include <wiringPiI2C.h>
#include <bme280.h>

#include "generalsensor.h"

static const int EnvironmentalSensor_MSEC = 1000;

class QTimer;

class Environmentalsensor : public QObject
{
    //Q_OBJECT Makro
    //Es ist fuer die Erzeugung von Signal&Slots oder Proterties wichtig
    //Dass der Meta-Objekt-Compiler(der am Mock) den dementsprechenden
    //Standard C++ Code generiert
    Q_OBJECT

    Q_PROPERTY(qreal temperature READ getTemperature NOTIFY temperatureChanged);
    Q_PROPERTY(qreal pressure READ getPressure NOTIFY pressureChanged);
    Q_PROPERTY(qreal humidity READ getHumidity NOTIFY humidityChanged);
public:
    explicit Environmentalsensor(QObject *parent = nullptr);
    qreal getTemperature() const;
    qreal getPressure() const;
    qreal getHumidity() const;
    Q_INVOKABLE void stop();

signals:
    void temperatureChanged();
    void pressureChanged();
    void humidityChanged();

private:
    void setUp();
    void readData();
    int fd;
    bme280_calib_data cal;
    float m_temperature, m_pressure, m_humidity;
    QTimer * m_timer;
};

#endif // ENVIRONMENTALSENSOR_H
