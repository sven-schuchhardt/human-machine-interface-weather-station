#ifndef GENERALSENSOR_H
#define GENERALSENSOR_H

#include <QTimer>

static const int MSEC = 1000;

class GeneralSensor: public QObject
{
    Q_OBJECT
public:
    GeneralSensor(QObject *parent = nullptr);

private:
    virtual void setUp() = 0;
    virtual void readData() = 0;
protected:
    QTimer * m_timer;
};

#endif // GENERALSENSOR_H
