import QtQuick 2.15
import QtQuick.Layouts 1.15
import "./components"  // Import local components from components directory
import "./ApplicationLauncher.qml" as AppLauncher
import "./AppsMenu.qml" as AppsMenu
import "./FileManager.qml" as FileManager
import "./AudioControls.qml" as AudioControls
import "./SystemSettings.qml" as SystemSettings

ShellRoot {
    id: root
    // Theme will be loaded from external file
    property color background: "#10151d"
    property color panel: "#202a36"
    property color red: "#a51f2b"
    property color gold: "#d9a52e"
    property color blue: "#234b78"
    property color cream: "#e9dfc5"
    property color amber: "#f2a65a"

    // Telemetry data properties
    property var telemetryData: [
        {label: "REACTOR", value: "12%", unit: "LOAD", graphValue: 0.12},
        {label: "CPU", value: "43%", unit: "", graphValue: 0.43},
        {label: "GPU", value: "61%", unit: "", graphValue: 0.61},
        {label: "MEMORY", value: "8.2", unit: "/32GB", graphValue: 0.26}, // 8.2/32 = ~0.26
        {label: "TEMP", value: "52", unit: "°C", graphValue: 0.52}, // Assuming 100°C max
        {label: "NETWORK", value: "940", unit: "Mbps", graphValue: 0.47}, // Assuming 2Gbps max
        {label: "DNS QRY", value: "1.2K", unit: "/DAY", graphValue: 0.6},
        {label: "ADS BLK", value: "847", unit: "/DAY", graphValue: 0.71},
        {label: "CLIENTS", value: "12", unit: "ACTIVE", graphValue: 0.4},
        {label: "DOMAINS", value: "244", unit: "BLOCKED", graphValue: 0.82},
        {label: "FORWARD", value: "ONLINE", unit: "", graphValue: 1.0},
        {label: "CACHE HIT", value: "18%", unit: "", graphValue: 0.18},
        {label: "BLOCK RATE", value: "42%", unit: "", graphValue: 0.42},
        {label: "PIHOLE STATUS", value: "ENABLED", unit: "", graphValue: 1.0},
        {label: "FTL DNS", value: "10.2K", unit: "/DAY", graphValue: 0.68},
        {label: "ADS BLOCKED T", value: "847", unit: "/TODAY", graphValue: 0.31},
        {label: "UNIQUE DOM", value: "45", unit: "/DAY", graphValue: 0.25},
        {label: "UNIQUE CLT", value: "8", unit: "/DAY", graphValue: 0.33},
        {label: "QUERY FORWARD", value: "65%", unit: "", graphValue: 0.65},
        {label: "QUERY CACHE", value: "23%", unit: "", graphValue: 0.23},
        {label: "BLOCKED PORTS", value: "0", unit: "", graphValue: 0.0}
    ]

    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: bar
            required property var modelData
            screen: modelData
            anchors { top: true; left: true; right: true }
            implicitHeight: 76
            color: "transparent"
            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.namespace: "davion-lcars"

            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#10151d" }
                    GradientStop { position: 1.0; color: "#0a0f16" }
                }
                Rectangle { anchors.left: parent.left; width: 12; height: parent.height; color: root.red }
                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 26
                    anchors.rightMargin: 18
                    spacing: 10

                    Rectangle {
                        Layout.preferredWidth: 190; Layout.fillHeight: true
                        color: root.red
                        radius: 18
                        Rectangle { width: 26; height: 26; radius: 13; color: root.gold; anchors.left: parent.left; anchors.leftMargin: 12; anchors.verticalCenter: parent.verticalCenter }
                        Column {
                            anchors.left: parent.left; anchors.leftMargin: 48; anchors.verticalCenter: parent.verticalCenter
                            Text { text: "HOUSE DAVION"; color: root.cream; font.pixelSize: 14; font.bold: true }
                            Text { text: "COMMAND SYSTEM"; color: root.gold; font.pixelSize: 10; font.letterSpacing: 1.5 }
                            // Add a pulsing animation to the emblem (the gold circle)
                            SequentialAnimation on emblem.circle.opacity {
                                loops: Animation.Infinite
                                PauseAnimation { duration: 1000 }
                                NumberAnimation { to: 0.3; duration: 1500 }
                                NumberAnimation { to: 1.0; duration: 1500 }
                            }
                        }
                    }
                    Rectangle { Layout.fillWidth: true; Layout.fillHeight: true; color: root.panel; radius: 18
                        RowLayout {
                            anchors.fill: parent; anchors.margins: 12
                            // Left-aligned: Time
                            Text { text: Qt.formatDateTime(new Date(), "ddd  dd MMM  yyyy  •  hh:mm"); color: root.cream; font.pixelSize: 14 }
                            Item { Layout.fillWidth: true } // Spacer to push the next items to the right
                            // Right-aligned: Network, Battery, Settings
                            RowLayout {
                                spacing: 8
                                NetworkIndicator {
                                    id: networkIndicator
                                    signalStrength: 0.8
                                }
                                BatteryIndicator {
                                    id: batteryIndicator
                                    chargeLevel: 0.8
                                }
                                LcarsButton {
                                    text: "⚙" // Gear icon for settings
                                    buttonColor: "#202a36"
                                    textColor: root.cream
                                    radius: 18
                                    Layout.preferredWidth: 40
                                    Layout.preferredHeight: 40
                                    onClicked: {
                                        systemSettings.open()
                                    }
                                }
                            }
                        }
                    }
                    Rectangle { Layout.preferredWidth: 150; Layout.fillHeight: true; color: root.blue; radius: 18
                        Column { anchors.centerIn: parent; spacing: 3
                            Text { 
                                id: tacticalLinkText
                                text: "COMMAND READY"
                                color: root.cream
                                font.pixelSize: 11
                                font.bold: true
                                // Animate the text color to pulse between cream and gold
                                NumberAnimation on color {
                                    loops: Animation.Infinite
                                    from: "#e9dfc5"
                                    to: "#d9a52e"
                                    duration: 2000
                                }
                            }
                            // Replace the simple online indicator with a pulsing status light
                            StatusLight {
                                id: tacticalLinkLight
                                lightColor: "#8fd6a3"
                                glowing: true
                            }
                        }
                    }
                }
            }
        }
    }

    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: dock
            required property var modelData
            screen: modelData
            anchors { left: true; top: true; bottom: true }
            margins { top: 90; bottom: 18; left: 12 }
            implicitWidth: 82
            color: "transparent"
            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.namespace: "davion-lcars-dock"
            Rectangle {
                anchors.fill: parent; color: root.panel; radius: 22
                ColumnLayout {
                    anchors.fill: parent; anchors.margins: 10; spacing: 10
                    Repeater {
                        model: [
                            ["⌂","HOME"],["▦","APPS"],["◈","DATA"],
                            ["♫","AUDIO"],["⚙","SYS"]
                        ]
                        delegate: LcarsButton {
                            required property var modelData
                            Layout.fillWidth: true; Layout.preferredHeight: 66
                            radius: 15; color: index === 0 ? root.gold : root.blue
                            textColor: index === 0 ? root.background : root.cream
                            text: modelData[0]
                            onClicked: {
                                switch (modelData[1]) {
                                    case "HOME": 
                                        appLauncher.open()
                                        break;
                                    case "APPS": 
                                        appsMenu.open()
                                        break;
                                    case "DATA": 
                                        fileManager.open()
                                        break;
                                    case "AUDIO": 
                                        audioControls.open()
                                        break;
                                    case "SYS": 
                                        systemSettings.open()
                                        break;
                                }
                            }
                            Column { anchors.centerIn: parent; spacing: 2
                                Text { text: modelData[0]; color: parent.textColor; font.pixelSize: 23; anchors.horizontalCenter: parent.horizontalCenter }
                                Text { text: modelData[1]; color: parent.textColor; font.pixelSize: 9; font.bold: true; anchors.horizontalCenter: parent.horizontalCenter }
                            }
                        }
                    }
                    Item { Layout.fillHeight: true }
                    Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 8; radius: 4; color: root.red }
                }
            }
        }
    }

    // Updated Telemetry Panel with live data
    PanelWindow {
        id: telemetry
        screen: Quickshell.screens[0]
        anchors { right: true; top: true; bottom: true }
        margins { top: 90; bottom: 18; right: 12 }
        implicitWidth: 250
        color: "transparent"
        WlrLayershell.layer: WlrLayer.Top
        WlrLayershell.namespace: "davion-lcars-telemetry"
        TelemetryPanel {  // Now this should work with "./components" import
            anchors.fill: parent
            model: root.telemetryData
        }
    }
}