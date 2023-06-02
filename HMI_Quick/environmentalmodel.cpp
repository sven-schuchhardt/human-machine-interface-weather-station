#include "EnvironmentalModel.h"

EnviromentalModel::EnviromentalModel()
{

}

int EnviromentalModel::rowCount(const QModelIndex &parent) const
{
    return m_temperatures.count();
}

QVariant EnviromentalModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid())
        return QVariant();

    switch (role) {
    case roleLight:
        return QVariant(m_lights.at(index.row()));
    case roleTemperature:
        return QVariant(m_temperatures.at(index.row()));
    case rolePressure:
        return QVariant(m_pressures.at(index.row()));
    case roleHumidity:
        return QVariant(m_humidities.at(index.row()));
    default:
        return QVariant("empty");
    }
}

//saves the data from the sensors inside of an map for the listView
QHash<int, QByteArray> EnviromentalModel::roleNames() const
{
    QHash<int, QByteArray> mapping;

    mapping[roleLight] = "_roleLight";
    mapping[roleTemperature] = "_roleTemperature";
    mapping[rolePressure] = "_rolePressure";
    mapping[roleHumidity] = "_roleHumidity";

    return mapping;
}

void EnviromentalModel::append(bool light, qreal temperature, qreal pressure, qreal humidity)
{
    beginInsertRows(QModelIndex(), m_temperatures.length(), m_temperatures.length());
    m_lights.append(light);
    m_temperatures.append(temperature);
    m_pressures.append(pressure);
    m_humidities.append(humidity);
    endInsertRows();
}
