#ifndef ENVIROMENTALMODEL_H
#define ENVIROMENTALMODEL_H

#include <QAbstractListModel>

enum Roles{
    roleLight = Qt::UserRole +1,
    roleTemperature,
    rolePressure,
    roleHumidity,
};

class EnviromentalModel : public QAbstractListModel
{
    Q_OBJECT
public:
    EnviromentalModel();
    //return row count
    int rowCount(const QModelIndex & parent) const override;
    //return data, base on current index and requestrole
    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void append(bool light, qreal temperature, qreal pressure, qreal humidity);

private:
    QList<bool> m_lights;
    QList<qreal> m_temperatures;
    QList<qreal> m_pressures;
    QList<qreal> m_humidities;
};

#endif // ENVIROMENTALMODEL_H
