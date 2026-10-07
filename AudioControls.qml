// AudioControls.qml
// Audio volume and playback controls

import QtQuick
import QtQuick.Layouts
import "./components" as Components

Popup {
    id: audioControls
    width: 350
    height: 300
    background: Rectangle {
        color: "#10151d"
        border.color: "#d9a52e"
        border.width: 2
        radius: 12
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        Text {
            text: "AUDIO CONTROLS"
            color: "#d9a52e"
            font.pixelSize: 18
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            Layout.fillWidth: true
            height: 2
            color: "#a51f2b"
        }

        // Volume control
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 8

            RowLayout {
                Text {
                    text: "Master Volume"
                    color: "#e9dfc5"
                    font.pixelSize: 14
                }
                Item { Layout.fillWidth: true }
                Text {
                    text: "72%"
                    color: "#d9a52e"
                    font.pixelSize: 14
                    font.bold: true
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: 6
                color: "#202a36"
                radius: 3

                Rectangle {
                    width: parent.width * 0.72
                    height: parent.height
                    color: "#d9a52e"
                    radius: 3
                }
            }
        }

        // Output selector
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 8

            RowLayout {
                Text {
                    text: "Output Device"
                    color: "#e9dfc5"
                    font.pixelSize: 14
                }
                Item { Layout.fillWidth: true }
                Text {
                    text: "Desktop Speakers"
                    color: "#d9a52e"
                    font.pixelSize: 14
                    font.bold: true
                }
            }

            Components.LcarsButton {
                text: "▼"
                buttonColor: "#202a36"
                textColor: "#e9dfc5"
                radius: 6
                Layout.preferredWidth: 30
                Layout.preferredHeight: 24
                onClicked: {
                    console.log("Open output selector")
                }
            }
        }

        // Playback controls
        RowLayout {
            Layout.fillWidth: true
            spacing: 12

            Components.LcarsButton {
                text: "⏮"
                buttonColor: "#202a36"
                textColor: "#e9dfc5"
                radius: 10
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
                onClicked: {
                    console.log("Previous track")
                }
            }

            Components.LcarsButton {
                text: "▶"
                buttonColor: "#d9a52e"
                textColor: "#10151d"
                radius: 10
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
                onClicked: {
                    console.log("Play/Pause")
                }
            }

            Components.LcarsButton {
                text: "⏭"
                buttonColor: "#202a36"
                textColor: "#e9dfc5"
                radius: 10
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
                onClicked: {
                    console.log("Next track")
                }
            }

            Components.LcarsButton {
                text: "🔇"
                buttonColor: "#202a36"
                textColor: "#e9dfc5"
                radius: 10
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
                onClicked: {
                    console.log("Mute toggle")
                }
            }
        }

        // Now playing
        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            Components.LcarsButton {
                text: "🎵"
                buttonColor: "#202a36"
                textColor: "#e9dfc5"
                radius: 12
                Layout.preferredWidth: 36
                Layout.preferredHeight: 36
            }

            ColumnLayout {
                Text {
                    text: "Unknown Artist"
                    color: "#e9dfc5"
                    font.pixelSize: 12
                }
                Text {
                    text: "Unknown Track"
                    color: "#d9a52e"
                    font.pixelSize: 14
                    font.bold: true
                }
            }
        }
    }
}