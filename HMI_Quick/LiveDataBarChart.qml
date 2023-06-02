import QtQuick 2.0

Item {
    id: root
    property var colorTable: ["lightblue", "orange"]
    property var settingsColorListGraph
    property var settingsIsSimulating

    Rectangle {
        id: backgroundRectangle
        color: "Gray"
        anchors.fill: parent
        radius: 10

        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "lightsteelblue"
            }
            GradientStop{
                position: 1.4
                color: "blue"
            }
        }

        BarChart{
            anchors.bottom: backgroundRectangle.bottom
            title: 'Live Data Bar Chart'
            yLabel: 'on/off - C - kg/m - hPa'
            xLabel: 'SensorType'
            visible: !settingsIsSimulating.simulating
            points: [
                {x: 'Light',            y:  _lightsensor.light * 100 , color: settingsColorListGraph.colorBars},
                {x: 'Temperature',      y: _environmentalsensor.temperature   ,color: settingsColorListGraph.colorBars},
                {x: 'Humidity',         y: _environmentalsensor.humidity, color: settingsColorListGraph.colorBars},
                {x: 'Pressure',         y:  _environmentalsensor.pressure, color: settingsColorListGraph.colorBars},
            ]
        }
        BarChart{
            anchors.bottom: backgroundRectangle.bottom
            title: 'Live Data Bar Chart'
            yLabel: 'on/off - C - kg/m - hPa'
            xLabel: 'SensorType'
            visible: settingsIsSimulating.simulating
            points: [
                {x: 'Light',            y:  _simulatedata.light , color: settingsColorListGraph.colorBarsLight},
                {x: 'Temperature',      y: _simulatedata.temperature   ,color: settingsColorListGraph.colorBarsTemperature},
                {x: 'Humidity',         y: _simulatedata.humidity, color: settingsColorListGraph.colorBarsHumidity},
                {x: 'Pressure',         y:  _simulatedata.pressure, color: settingsColorListGraph.colorBarsPressure},
            ]

        }
    }
}
