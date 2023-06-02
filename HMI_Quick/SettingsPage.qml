import QtQuick 2.0

Item {
    id: root
    property var settingsAccuracyValues
    property var settingsFrequentSensor
    property var settingsColorListGraph
    property var settingsIsSimulating
    property var settingsIsLoadingScreen

    Rectangle {
        anchors.fill: parent
        anchors.margins: 30
        color: "gray"
        radius: 10


        SettingsItem {
            id: accuracyValues
            settingsValues: root.settingsAccuracyValues
            firstValue: 1
            secondValue: 2
            name: root.settingsAccuracyValues.category
            firstButtonText: "1"
            secondButtonText: "2"
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
        }

        SettingsItem {
            id: frequentSensor
            settingsValues: root.settingsFrequentSensor
            firstValue: 1000
            secondValue: 10000
            name: root.settingsFrequentSensor.category
            firstButtonText: "1000"
            secondButtonText: "10000"
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 360
        }

        SettingsItem {
            id: colorListGraph
            name: root.settingsColorListGraph.category
            settingsValues: root.settingsColorListGraph
            firstValue: "blue"
            secondValue: "red"
            firstButtonText: "Blue"
            secondButtonText: "Red"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 180
            anchors.left: parent.left
            anchors.leftMargin: 20
        }


        SettingsItem{
            id: simulateSensorEnableDisable
            settingsValues: root.settingsIsSimulating
            firstValue: true
            secondValue: false
            name: root.settingsIsSimulating.category
            firstButtonText: "True"
            secondButtonText: "False"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 180
            anchors.right: parent.right
            anchors.rightMargin: 360
        }

    }
}
