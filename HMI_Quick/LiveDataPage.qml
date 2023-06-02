import QtQuick 2.0

Item {
    id: root
    property var settingsAccuracyValues
    property var settingsFrequentSensor
    property var settingsColorListGraph
    property var settingsIsSimulating

    Rectangle {
        anchors.fill: parent
        anchors.margins: 30
        color: "gray"
        radius: 10

        LiveDataBarChart{
            settingsColorListGraph: root.settingsColorListGraph
            settingsIsSimulating: root.settingsIsSimulating
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.right: liveDataList.left
            anchors.rightMargin: 30
        }

        LiveDataList{
            id: liveDataList
            settingsAccuracyValues: root.settingsAccuracyValues
            settingsFrequentSensor: root.settingsFrequentSensor
            settingsColorListGraph: root.settingsColorListGraph
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.right: parent.right
            anchors.rightMargin: 30
        }
    }
}
