// ApplicationLauncher.qml
// A simple application launcher popup

import QtQuick
import QtQuick.Layouts
import "./components" as Components

Popup {
    id: appLauncher
    width: 400
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
        spacing: 12

        Text {
            text: "APPLICATION LAUNCHER"
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

        // Search bar
        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            TextField {
                placeholderText: "Search applications..."
                Layout.fillWidth: true
                background: Rectangle {
                    color: "#202a36"
                    radius: 6
                }
                color: "#e9dfc5"
                font.pixelSize: 14
            }

            Components.LcarsButton {
                text: "🔍"
                buttonColor: "#d9a52e"
                textColor: "#10151d"
                radius: 6
                Layout.preferredWidth: 40
                Layout.preferredHeight: 32
                onClicked: {
                    console.log("Search triggered")
                    // Implement search functionality
                }
            }
        }

        // Application grid
        GridView {
            id: appGrid
            Layout.fillWidth: true
            Layout.fillHeight: true
            cellWidth: 80
            cellHeight: 80
            model: 20 // Placeholder - would be actual apps
            delegate: Components.LcarsButton {
                text: modelData > 9 ? String.fromCharCode(64 + modelData) : String(modelData) // A, B, C, etc.
                buttonColor: "#202a36"
                textColor: "#e9dfc5"
                radius: 10
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                onClicked: {
                    console.log("Launching app:", modelData)
                    appLauncher.close()
                    // TODO: Actually launch application
                }
            }
        }
    }
}