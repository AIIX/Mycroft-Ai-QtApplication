import QtQuick 2.5
import QtQml.Models 2.2
import QtQuick.Controls 2.0

Column {
                    spacing: 6
                    anchors.right: parent.right

                    readonly property bool sentByMe: model.recipient !== "User"
                    property alias mssg: messageText.text
                        
                    Row {
                        id: messageRow
                        spacing: 6
                            
                    Rectangle {
                        id: messageRect
                        width: cbwidth
                        radius: 2
                        height: messageText.implicitHeight + 24
                        color: "#111"
                        
                    Label {
                        id: messageText
                        text: model.InputQuery
                        anchors.fill: parent
                        anchors.margins: 12
                        wrapMode: Label.Wrap
                        font.pixelSize: innerset.fntsize
                        color: "#fff"
                        
                        }
                            }
                                }
                                    }
