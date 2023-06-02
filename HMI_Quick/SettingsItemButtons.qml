import QtQuick 2.0

Item {
    property var settingsValues
    property var value
    property string name
    property string buttonText

    Rectangle{
        width: 85
        height: 60
        radius: 10
        color: "white"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        Text {
            text: buttonText
            anchors.centerIn: parent
        }

        MouseArea {
            id: myMouseArea
            anchors.fill: parent
            onClicked:{
                switch(name){
                case "Accuracy of the values":
                    settingsValues.accuracy = value;
                    break;
                case "Frquenct of the sensor query":
                    settingsValues.frequent = value;
                    break;
                case "Color of the List/Graph":
                    settingsValues.colorBars = value;
                    break;
                case "Enable/Disable the loading screen":
                    settingsValues.isLoading = value;
                    break;
                }
            }
        }
    }
}
