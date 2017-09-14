import QtQuick 2.5
import QtQml.Models 2.2
import QtQuick.Controls 2.0
import QtWebEngine 1.5
//import QtWebKit 3.0
//import QtWebKit.experimental 1.0

Column {
                    spacing: 6
                    anchors.right: parent.right
                        
                    Row {
                        id: messageRow
                        spacing: 6
                            
                    Rectangle {
                        id: messageRect
                        width: cbwidth
                        radius: 2
                        height: newikiFlick.height
                        color: "#111"

                        Flickable {
                            id: newikiFlick
                            width: messageRect.width
                            height: 250

                            WebEngineView {
                                id: wikiview
                                anchors.fill: parent
                                url: "file:///" + model.InputQuery
                                //experimental.userAgent: "Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3"

                                onLoadingChanged: {
                                console.log(wikiview.url)
                                }
                                    }
                                        }
                                            }
                                                }
                                                    }
