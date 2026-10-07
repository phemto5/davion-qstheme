// StatusLight.qml
// A reusable LCARS-styled status light (circle) with color indicating state

import QtQuick

Rectangle {
    property color lightColor: "#202a36"    // default: off/dark
    property bool glowing: false
    property int pulseInterval: 1000        // ms

    width: 14
    height: width
    radius: width / 2
    color: lightColor

    // Optional pulsing glow effect
    Behavior on color {
        NumberAnimation { duration: 500 }
    }

    // Optional outer glow when active
    Row {
        anchors.fill: parent
        visible: glowing
        Rectangle {
            width: parent.width * 1.5
            height: parent.height * 1.5
            radius: width * 0.75
            color: Qt.darker(lightColor, 1.2)
            opacity: 0.3
        }
    }

    // Pulsing animation for active state
    SequentialAnimation on glowing {
        loops: Animation.Infinite
        PauseAnimation { duration: pulseInterval / 2 }
        PropertyChanges { target: parent; glowing: false }
        PauseAnimation { duration: pulseInterval / 2 }
        PropertyChanges { target: parent; glowing: true }
    }
    running: glowing
}