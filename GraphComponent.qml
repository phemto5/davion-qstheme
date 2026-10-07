// GraphComponent.qml
// A simple bar graph for showing percentages

import QtQuick

Item {
    property real value: 0.0    // 0.0 to 1.0
    property color color: "#d9a52e"
    property color backgroundColor: "#202a36"
    property real barHeight: 0.6 // fraction of total height
    property real radius: 4

    width: 60
    height: 20

    Rectangle {
        anchors.fill: parent
        color: backgroundColor
        radius: radius

        Rectangle {
            anchors { left: parent.left; bottom: parent.bottom; verticalCenter: undefined }
            width: parent.width * value
            height: parent.height * barHeight
            color: color
            radius: radius
        }
    }
}