// AppsMenu.qml
// A simple apps menu popup

import QtQuick
import QtQuick.Layouts
import "./components" as Components

Popup {
    id: appsMenu
    width: 350
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
            text: "APPLICATIONS MENU"
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

        // Common applications
        GridView {
            id: appsGrid
            Layout.fillWidth: true
            Layout.fillHeight: true
            cellWidth: 70
            cellHeight: 70
            model: [
                {name: "Terminal", icon: ""},
                {name: "Browser", icon: ""},
                {name: "File Manager", icon: ""},
                {name: "Text Editor", icon: ""},
                {name: "Settings", icon: ""},
                {name: "System Monitor", icon: ""},
                {name: "Calculator", icon: ""},
                {name: "Calendar", icon: ""},
                {name: "Music", icon: ""},
                {name: "Video", icon: ""}
            ]
            delegate: Components.LcarsButton {
                text: modelData.icon
                buttonColor: "#202a36"
                textColor: "#e9dfc5"
                radius: 12
                Layout.preferredWidth: 50
                Layout.preferredHeight: 50
                onClicked: {
                    console.log("Launching:", modelData.name)
                    appsMenu.close()
                    // TODO: Actually launch the application
                }
            }
        }
    }
}