import QtQuick 2.12
//import QtQuick.Window 2.12
import QtQuick.Controls 2.1
import Qt.labs.settings 1.0


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Settings {
        id: accuracyValues
        category: "Accuracy of the values"
        property int accuracy: 1
    }
    Settings {
        id: frequentSensor
        category: "Frequent of the sensor query"
        property int frequent: 10000
    }
    Settings {
        id: colorListGraph
        category: "Color of the List/Graph"
        property color colorBars: "blue"
    }

    Settings {
        id: isSimulating
        category: "Enable/Disable value simulation"
        property bool simulating: false
    }

    footer:TabBar {
        id: tabBar
        visible: !startingPage.visible
        TabButton{
            text: qsTr("Live Data")
        }
        TabButton{
            text: qsTr("Settings")
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill:parent
        currentIndex: tabBar.currentIndex

        LiveDataPage{
            settingsAccuracyValues: accuracyValues
            settingsFrequentSensor: frequentSensor
            settingsColorListGraph: colorListGraph
            settingsIsSimulating: isSimulating
        }
        SettingsPage{
            settingsAccuracyValues: accuracyValues
            settingsFrequentSensor: frequentSensor
            settingsColorListGraph: colorListGraph
            settingsIsSimulating: isSimulating
        }
    }

    PageIndicator {
        id: indicator
        visible: !startingPage.visible
        count: swipeView.count;
        currentIndex: swipeView.currentIndex
        anchors.bottom: swipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}

