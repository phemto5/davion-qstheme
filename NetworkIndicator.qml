// NetworkIndicator.qml
// A simple network activity indicator

import QtQuick

Item {
    id: networkIndicator
    property real signalStrength: 0.8 // 0.0 to 1.0
    property color connectedColor: "#8fd6a3"
    property color disconnectedColor: "#ff5555"
    property bool isConnected: true

    width: 20
    height: 20

    // Network icon (simplified as bars)
    Row {
        anchors.centerIn: parent
        spacing: 2

        Repeater {
            model: 4
            delegate: Rectangle {
                width: 3
                height: parent.height * (0.3 + index * 0.15) // varying heights
                color: networkIndicator.isConnected ? networkIndicator.connectedColor : networkIndicator.disconnectedColor
                radius: 1
                // Animated height based on signalStrength (simulated)
                Behavior on height {
                    NumberAnimation { duration: 500 }
                }
            }
        }
    }

    // Tooltip or status text could be added
}