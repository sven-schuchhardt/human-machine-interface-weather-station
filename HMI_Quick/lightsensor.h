#ifndef LIGHTSENSOR_H
#define LIGHTSENSOR_H

#include <QObject>
#include <QTimer>
#include <QDebug>
extern "C" {
#include <wiringPi.h>
}

class QTimer;
static const int LightSensor_MSEC = 1000;

class LightSensor: public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool light READ getLight NOTIFY lightChanged);

public:
    explicit LightSensor(QObject *parent = nullptr);
    bool getLight() const;
    Q_INVOKABLE void stop();

signals:
    void lightChanged();

private:
    void setUp();
    void readData();
    bool m_light;
    QTimer * m_timer;
};

#endif // LIGHTSENSOR_H
