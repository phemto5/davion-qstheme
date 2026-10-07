// TelemetryPanel.qml
// A panel displaying live system telemetry (CPU, memory, etc.)

import QtQuick
import QtQuick.Layouts

LcarsPanel {
    id: telemetryPanel
    property var model: [] // List of {label: string, value: string, unit?: string, graphValue?: real}
    property color panelColor: "#202a36"
    property color textColor: "#e9dfc5"
    property color accentColor: "#d9a52e"
    property color valueColor: "#e9dfc5"
    property color graphColor: "#d9a52e"
    property color graphBackgroundColor: "#202a36"

    color: panelColor
    radius: 22
    border.color: accentColor
    border.width: 2

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        Text {
            text: "SHIP SYSTEMS"
            color: accentColor
            font.pixelSize: 17
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            Layout.fillWidth: true
            height: 5
            color: "#a51f2b"
            radius: 3
        }

        Repeater {
            model: telemetryPanel.model
            delegate: ColumnLayout {
                required property var modelData
                Layout.fillWidth: true
                spacing: 4

                Text {
                    text: modelData.label
                    color: telemetryPanel.accentColor
                    font.pixelSize: 11
                    font.bold: true
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 30
                    color: telemetryPanel.panelColor
                    radius: 8

                    RowLayout {
                        anchors.fill: parent
                        Text {
                            text: modelData.value + (modelData.unit || "")
                            color: telemetryPanel.valueColor
                            font.pixelSize: 12
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: 4
                            rightPadding: 4
                        }
                        // Show graph if graphValue is provided (0.0 to 1.0)
                        GraphComponent {
                            visible: modelData.graphValue !== undefined
                            width: 40
                            height: 20
                            color: telemetryPanel.graphColor
                            backgroundColor: telemetryPanel.graphBackgroundColor
                            value: modelData.graphValue
                        }
                    }
                }
            }
        }

        Item { Layout.fillHeight: true }

        Text {
            text: "FEDERATED SUNS  •  3025"
            color: "#234b78"
            font.pixelSize: 10
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }
    }
}