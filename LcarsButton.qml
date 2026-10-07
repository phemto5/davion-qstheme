// LcarsButton.qml
// A reusable LCARS-styled button with rounded corners and color

import QtQuick

Rectangle {
    property color buttonColor: "#202a36"
    property color textColor: "#e9dfc5"
    property real radius: 18
    property string text: ""
    property alias onClicked: mouseArea.clicked

    color: buttonColor
    radius: radius

    Text {
        text: parent.text
        color: parent.textColor
        anchors.centerIn: parent
        font.pixelSize: 14
        font.bold: true
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onPressed: parent.buttonColor = "#2c384a"
        onReleased: parent.buttonColor = "#202a36"
        onEntered: parent.buttonColor = "#2c384a"
        onExited: parent.buttonColor = "#202a36"
    }
}