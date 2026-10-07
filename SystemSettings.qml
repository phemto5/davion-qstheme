// SystemSettings.qml
// System settings for telemetry and window configuration

import QtQuick
import QtQuick.Layouts
import "./components" as Components

Popup {
    id: systemSettings
    width: 450
    height: 500
    background: Rectangle {
        color: "#10151d"
        border.color: "#d9a52e"
        border.width: 2
        radius: 12
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 16

        Text {
            text: "SYSTEM SETTINGS"
            color: "#d9a52e"
            font.pixelSize: 20
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            Layout.fillWidth: true
            height: 2
            color: "#a51f2b"
        }

        // Settings tabs - simplified as buttons for now
        RowLayout {
            Layout.fillWidth: true
            spacing: 4

            Components.LcarsButton {
                text: "TELEMETRY"
                buttonColor: "#d9a52e"
                textColor: "#10151d"
                radius: 8
                Layout.fillWidth: true
                Layout.preferredHeight: 32
                onClicked: {
                    console.log("Switch to telemetry settings")
                    // TODO: Show telemetry settings panel
                }
            }

            Components.LcarsButton {
                text: "WINDOW"
                buttonColor: "#202a36"
                textColor: "#e9dfc5"
                radius: 8
                Layout.fillWidth: true
                Layout.preferredHeight: 32
                onClicked: {
                    console.log("Switch to window settings")
                    // TODO: Show window settings panel
                }
            }

            Components.LcarsButton {
                text: "APPEARANCE"
                buttonColor: "#202a36"
                textColor: "#e9dfc5"
                radius: 8
                Layout.fillWidth: true
                Layout.preferredHeight: 32
                onClicked: {
                    console.log("Switch to appearance settings")
                    // TODO: Show appearance settings panel
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            height: 2
            color: "#a51f2b"
        }

        // Settings content area
        StackLayout {
            id: settingsStack
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: 0

            // Telemetry Settings Panel
            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 12

                GroupBox {
                    title: "Data Sources"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 8

                        Components.LcarsButton {
                            text: "Enable CPU Monitoring"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onCheckedChanged: {
                                console.log("CPU monitoring:", checked ? "enabled" : "disabled")
                            }
                        }

                        Components.LcarsButton {
                            text: "Enable GPU Monitoring"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onCheckedChanged: {
                                console.log("GPU monitoring:", checked ? "enabled" : "disabled")
                            }
                        }

                        Components.LcarsButton {
                            text: "Enable Memory Monitoring"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onCheckedChanged: {
                                console.log("Memory monitoring:", checked ? "enabled" : "disabled")
                            }
                        }

                        Components.LcarsButton {
                            text: "Enable Network Monitoring"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onCheckedChanged: {
                                console.log("Network monitoring:", checked ? "enabled" : "disabled")
                            }
                        }
                    }
                }

                GroupBox {
                    title: "Update Interval"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 8

                        Text {
                            text: "Telemetry refresh rate:"
                            color: "#e9dfc5"
                            Layout.alignment: Qt.AlignLeft
                        }
                        RowLayout {
                            Components.LcarsButton {
                                text: "1 sec"
                                buttonColor: "#202a36"
                                textColor: "#e9dfc5"
                                radius: 4
                                Layout.preferredWidth: 60
                                Layout.preferredHeight: 24
                                onClicked: {
                                    console.log("Set update interval to 1 second")
                                }
                            }
                            Components.LcarsButton {
                                text: "2 sec"
                                buttonColor: "#202a36"
                                textColor: "#e9dfc5"
                                radius: 4
                                Layout.preferredWidth: 60
                                Layout.preferredHeight: 24
                                onClicked: {
                                    console.log("Set update interval to 2 seconds")
                                }
                            }
                            Components.LcarsButton {
                                text: "5 sec"
                                buttonColor: "#202a36"
                                textColor: "#e9dfc5"
                                radius: 4
                                Layout.preferredWidth: 60
                                Layout.preferredHeight: 24
                                onClicked: {
                                    console.log("Set update interval to 5 seconds")
                                }
                            }
                        }
                    }
                }
            }

            // Window Settings Panel
            ColumnLayout {
                visible: false
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 12

                GroupBox {
                    title: "Window Behavior"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 120
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 8

                        Components.LcarsButton {
                            text: "Auto-hide panels"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onCheckedChanged: {
                                console.log("Auto-hide panels:", checked ? "enabled" : "disabled")
                            }
                        }

                        Components.LcarsButton {
                            text: "Snap to screen edges"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onCheckedChanged: {
                                console.log("Snap to edges:", checked ? "enabled" : "disabled")
                            }
                        }

                        Components.LcarsButton {
                            text: "Show workspace indicators"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onCheckedChanged: {
                                console.log("Workspace indicators:", checked ? "enabled" : "disabled")
                            }
                        }

                        Components.LcarsButton {
                            text: "Enable window previews"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onCheckedChanged: {
                                console.log("Window previews:", checked ? "enabled" : "disabled")
                            }
                        }
                    }
                }

                GroupBox {
                    title: "Animations"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 8

                        Components.LcarsButton {
                            text: "Enable panel animations"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onCheckedChanged: {
                                console.log("Panel animations:", checked ? "enabled" : "disabled")
                            }
                        }

                        Components.LcarsButton {
                            text: "Enable pulsing effects"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onCheckedChanged: {
                                console.log("Pulsing effects:", checked ? "enabled" : "disabled")
                            }
                        }

                        Components.LcarsButton {
                            text: "Enable gradient effects"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onCheckedChanged: {
                                console.log("Gradient effects:", checked ? "enabled" : "disabled")
                            }
                        }
                    }
                }
            }

            // Appearance Settings Panel
            ColumnLayout {
                visible: false
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 12

                GroupBox {
                    title: "Theme Selection"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 8

                        Components.LcarsButton {
                            text: "Davion Command"
                            buttonColor: "#d9a52e"
                            textColor: "#10151d"
                            radius: 8
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onClicked: {
                                console.log("Switch to Davion Command theme")
                                // TODO: Apply Davion theme
                            }
                        }

                        Components.LcarsButton {
                            text: "Starfleet LCARS"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 8
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onClicked: {
                                console.log("Switch to Starfleet LCARS theme")
                                // TODO: Apply Starfleet theme
                            }
                        }

                        Components.LcarsButton {
                            text: "MechWarrior Tactical HUD"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 8
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onClicked: {
                                console.log("Switch to MechWarrior Tactical HUD theme")
                                // TODO: Apply MechWarrior theme
                            }
                        }
                    }
                }

                GroupBox {
                    title: "Color Customization"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 8

                        Components.LcarsButton {
                            text: "Primary Color"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onClicked: {
                                console.log("Open primary color picker")
                            }
                        }

                        Components.LcarsButton {
                            text: "Accent Color"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onClicked: {
                                console.log("Open accent color picker")
                            }
                        }

                        Components.LcarsButton {
                            text: "Background Color"
                            buttonColor: "#202a36"
                            textColor: "#e9dfc5"
                            radius: 6
                            Layout.fillWidth: true
                            Layout.preferredHeight: 24
                            onClicked: {
                                console.log("Open background color picker")
                            }
                        }
                    }
                }
            }
        }
    }
}