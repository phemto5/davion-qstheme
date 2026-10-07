// FileManager.qml
// A simple file manager popup

import QtQuick
import QtQuick.Layouts
import "./components" as Components

Popup {
    id: fileManager
    width: 500
    height: 400
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
            text: "FILE MANAGER"
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

        // Path bar
        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            Components.LcarsButton {
                text: "←"
                buttonColor: "#202a36"
                textColor: "#e9dfc5"
                radius: 6
                Layout.preferredWidth: 40
                Layout.preferredHeight: 32
                onClicked: {
                    console.log("Navigate back")
                }
            }

            TextField {
                placeholderText: "/home/user/documents"
                Layout.fillWidth: true
                background: Rectangle {
                    color: "#202a36"
                    radius: 6
                }
                color: "#e9dfc5"
                font.pixelSize: 14
            }

            Components.LcarsButton {
                text: "⟳"
                buttonColor: "#d9a52e"
                textColor: "#10151d"
                radius: 6
                Layout.preferredWidth: 40
                Layout.preferredHeight: 32
                onClicked: {
                    console.log("Refresh directory")
                }
            }
        }

        // File list
        ListView {
            id: fileList
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: 15 // Placeholder - would be actual files
            delegate: Components.LcarsButton {
                text: modelData > 9 ? "📄 File " + String(modelData) : "📁 Folder " + String(modelData)
                buttonColor: "#202a36"
                textColor: "#e9dfc5"
                radius: 8
                Layout.fillWidth: true
                Layout.preferredHeight: 24
                onClicked: {
                    console.log("Selected item:", modelData)
                    // TODO: Open file or navigate into folder
                }
            }
        }
    }
}