// Updated dock section with functional LcarsButton components
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
                        radius: 15
                        buttonColor: index === 0 ? root.gold : root.blue
                        textColor: index === 0 ? root.background : root.cream
                        text: modelData[0]  // Show the icon/symbol
                        onClicked: {
                            console.log("Button clicked:", modelData[1])
                            switch (modelData[1]) {
                                case "HOME": 
                                    console.log("Opening application launcher")
                                    break;
                                case "APPS": 
                                    console.log("Opening apps menu")
                                    break;
                                case "DATA": 
                                    console.log("Opening file manager")
                                    break;
                                case "AUDIO": 
                                    console.log("Opening audio controls")
                                    break;
                                case "SYS": 
                                    console.log("Opening system settings")
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