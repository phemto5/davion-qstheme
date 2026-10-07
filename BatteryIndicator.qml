// BatteryIndicator.qml
// A simple battery indicator

import QtQuick

Item {
    id: batteryIndicator
    property real chargeLevel: 0.8 // 0.0 to 1.0
    property bool charging: false
    property color chargedColor: "#8fd6a3"
    property color chargingColor: "#f2a65a"
    property color lowColor: "#ff5555"
    property color mediumColor: "#ffb86c"
    property color highColor: "#8fd6a3"

    width: 24
    height: 16

    // Battery outline
    Rectangle {
        id: batteryOutline
        anchors.fill: parent
        color: "transparent"
        border.width: 1
        border.color: "#e9dfc5"
        radius: 2
    }

    // Battery fill
    Rectangle {
        id: batteryFill
        anchors {
            left: batteryOutline.left
            top: batteryOutline.top
            bottom: batteryOutline.bottom
            margins: 2
        }
        width: parent.width * chargeLevel - 4 // subtract margins and outline
        color: chargeLevel > 0.8 ? highColor : (chargeLevel > 0.3 ? mediumColor : lowColor)
        radius: 1
    }

    // Charging indicator (a bolt) - simplified as a rectangle for now
    Rectangle {
        id: chargingIndicator
        anchors {
            right: batteryOutline.right
            verticalCenter: batteryOutline.verticalCenter
            margins: -2
        }
        width: 4
        height: 8
        color: charging ? chargingColor : "transparent"
        visible: charging
        radius: 2
    }
}