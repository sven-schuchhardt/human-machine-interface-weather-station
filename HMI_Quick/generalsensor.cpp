#include "generalsensor.h"

GeneralSensor::GeneralSensor(QObject *parent)
    :QObject(parent), m_timer(new QTimer(this))
{

}
