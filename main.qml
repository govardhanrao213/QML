/*
 * main.qml - Sensor Dashboard inspired UI
 * Built with QtQuick 2.15 and QtQuick.Controls 2.15
 * This UI displays Compass, Gyroscope, LRF, GPS, and Logging data
 */

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

ApplicationWindow {
    id: root
    visible: true
    width: 1280
    height: 800
    title: "Sensor Dashboard"

    Rectangle {
        anchors.fill: parent
        color: "#f4f6f9"

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            // Top Banner
            Rectangle {
                color: "#fca311"
                height: 40
                Layout.fillWidth: true
                Text {
                    anchors.centerIn: parent
                    text: "⚠️ Gyroscope readings outside normal range"
                    color: "white"
                    font.bold: true
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true

                // Sidebar
                Rectangle {
                    color: "#1e1e2f"
                    width: 180
                    Layout.fillHeight: true
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 10

                        Label { text: "IoT Dashboard"; color: "white"; font.bold: true; font.pixelSize: 16 }

                        Repeater {
                            model: ["Overview", "Compass", "Gyroscope", "LRF Sensor", "GPS Tracking", "Data Logs", "Settings"]
                            delegate: Button {
                                text: modelData
                                Layout.fillWidth: true
                                background: Rectangle { color: "transparent" }
                                contentItem: Text {
                                    text: modelData
                                    color: "white"
                                }
                            }
                        }
                    }
                }

                // Main content
                Flickable {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    contentHeight: contentColumn.height

                    ColumnLayout {
                        id: contentColumn
                        width: parent.width
                        spacing: 20

                        Rectangle {
                            width: parent.width - 40
                            height: 120
                            color: "white"
                            radius: 10
                            border.color: "#dcdcdc"

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 10
                                spacing: 20

                                ColumnLayout {
                                    spacing: 4
                                    Label { text: "Compass"; font.bold: true }
                                    Label { text: "Heading: 325.4°" }
                                    Label { text: "Accuracy: ±2.1°" }
                                    Label { text: "Declination: -12.3°" }
                                    Label { text: "Status: Calibrated"; color: "green" }
                                }
                                Rectangle {
                                    width: 60; height: 60; radius: 30
                                    color: "#e1e1e1"
                                    anchors.verticalCenter: parent.verticalCenter
                                    Text {
                                        anchors.centerIn: parent
                                        text: "N"
                                        font.pixelSize: 20
                                    }
                                }
                            }
                        }

                        Rectangle {
                            width: parent.width - 40
                            height: 120
                            color: "white"
                            radius: 10
                            border.color: "#dcdcdc"
                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 10
                                spacing: 20

                                ColumnLayout {
                                    spacing: 4
                                    Label { text: "Laser Range Finder"; font.bold: true }
                                    Label { text: "Distance: 24.73 meters" }
                                    Label { text: "Min: 0.1 m, Max: 100 m" }
                                    Label { text: "Rate: 20Hz, Accuracy: ±3cm" }
                                    Label { text: "ACTIVE"; color: "green" }
                                }
                            }
                        }

                        Rectangle {
                            width: parent.width - 40
                            height: 140
                            color: "white"
                            radius: 10
                            border.color: "#dcdcdc"
                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 10
                                spacing: 20

                                ColumnLayout {
                                    spacing: 4
                                    Label { text: "GPS Tracking"; font.bold: true }
                                    Label { text: "Lat: 37.7749, Lon: -122.4194" }
                                    Label { text: "Altitude: 52.3 m" }
                                    Label { text: "Satellites: 12, Speed: 0.0 km/h" }
                                    Label { text: "LOCKED"; color: "#888" }
                                }
                            }
                        }

                        Rectangle {
                            width: parent.width - 40
                            height: 140
                            color: "white"
                            radius: 10
                            border.color: "#dcdcdc"
                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 10
                                spacing: 4

                                Label { text: "Data Logging"; font.bold: true }
                                Label { text: "Status: Active" }
                                Label { text: "Duration: 02:34:17" }
                                Label { text: "Records: 45,802, Size: 2.3 MB" }

                                RowLayout {
                                    spacing: 10
                                    Button { text: "Stop Recording"; background: Rectangle { color: "#cc0000"; radius: 5 } }
                                    Button { text: "Export CSV"; background: Rectangle { color: "#0f9d58"; radius: 5 } }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
