import QtQuick 2.0
import Qt.labs.settings 1.0

Item {
    id: root

    property var settingsValues
    property var firstValue
    property var secondValue
    property string name
    property string firstButtonText
    property string secondButtonText


    Rectangle {
        width: 340
        height: 160
        radius: 10
        color: "blue"

        Text {
            id: myText
            text: name
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 10
        }

        SettingsItemButtons{
            settingsValues: root.settingsValues
            value: root.firstValue
            name: root.name
            buttonText: root.firstButtonText
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            anchors.left: parent.left
            anchors.leftMargin: 135
        }

        SettingsItemButtons{
            settingsValues: root.settingsValues
            value: root.secondValue
            name: root.name
            buttonText: root.secondButtonText
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            anchors.right: parent.right
            anchors.rightMargin: 50
        }
    }
}
