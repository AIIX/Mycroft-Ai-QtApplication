import QtQuick 2.0
import QtQuick.Controls 2.0

Column {
                    id: colmsg
                    spacing: 6
                    anchors.centerIn: parent

                    readonly property bool sentByMe: model.recipient !== "User"
                    //property alias mssg: messageText.text

                    Row {
                        id: messageRow
                        spacing: 6

                    Rectangle {
                        id: messageRect
                        width: cbwidth
                        radius: 2
                        height: root.height / 4
                        color: "#111"

                    Image {
                        id: messageText
                        anchors.centerIn: parent
                        anchors.margins: 5
                        fillMode: Image.PreserveAspectCrop
                        source: model.InputQuery
                        height: root.height / 5
                        width: root.width / 4
                        }
                            }
                                }
                                    }
