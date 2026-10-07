// LcarsPanel.qml
// A reusable LCARS-styled panel with rounded corners and color

import QtQuick

Rectangle {
    property color bgColor: "#202a36"
    property real cornerRadius: 18
    property real borderWidth: 0
    property color borderColor: "transparent"

    color: bgColor
    radius: cornerRadius
    border.width: borderWidth
    border.color: borderColor
}