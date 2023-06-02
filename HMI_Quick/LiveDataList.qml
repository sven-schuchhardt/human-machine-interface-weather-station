import QtQuick 2.0

Item {
    property var settingsAccuracyValues
    property var settingsFrequentSensor
    property var settingsColorListGraph
    width: 300

    Component {
        id: myDeligate
        Rectangle {
            width: parent.width
            height: 25
            gradient: Gradient {
                GradientStop { position: 0.0; color: settingsColorListGraph.colorBars}
                GradientStop { position: 0.6; color: "navy"}
            }
            opacity: 0.87
            Row {
                spacing: 10
                Text{
                    id: lightId
                    color: "white"
                    text: _roleLight
                }
                Text {
                    id:tempteratureId
                    color: "white"
                    text: _roleTemperature.toFixed(settingsAccuracyValues.accuracy)
                }

                Text {
                    id: pressureId
                    color: "white"
                    text: _rolePressure.toFixed(settingsAccuracyValues.accuracy)
                }

                Text {
                    id: humidityId
                    color: "white"
                    text: _roleHumidity.toFixed(settingsAccuracyValues.accuracy)
                }
            }
        }
    }

    Component {
        id: myHeader
        Rectangle {
            width: parent.width
            height: 25
            gradient: Gradient {
                GradientStop { position: 0.0; color: settingsColorListGraph.colorBars}
                GradientStop { position: 0.6; color: "navy"}
            }
            opacity: 0.87
            Row {
                spacing: 10
                Text{
                    id: lightId
                    color: "white"
                    text: "Light"
                }
                Text {
                    id:tempteratureId
                    color: "white"
                    text: "Tem"
                }

                Text {
                    id: pressureId
                    color: "white"
                    text: "Pres/10"
                }

                Text {
                    id: humidityId
                    color: "white"
                    text: "Humi"
                }
            }
        }
    }

    ListView {
        header: myHeader
        anchors.fill: parent
        delegate: myDeligate
        model: _enviromentalmodel
        clip: true
    }

    Timer {
        id: myTimerModel
        interval: settingsFrequentSensor.frequent
        repeat: true
        running: true
        onTriggered: {
            _enviromentalmodel.append(_lightsensor.light, _environmentalsensor.temperature, _environmentalsensor.pressure, _environmentalsensor.humidity)
        }
    }
}
