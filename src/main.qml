import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    signal submitTextField(string text)
    signal senddbussignal(string text)

    visible: true
    minimumWidth: 400
    minimumHeight:194
    maximumHeight: minimumHeight
    maximumWidth: minimumWidth
    color: "#1a1a1a"
    title: qsTr("Mycroft QtApplication")


     Rectangle {
        id: rectangleresultbox
        x: 0
        y: 38
        width: 400
        height: 120
        color: "#1d1d1d"
        border.color: "#80000000"
        border.width: 0

        Image {
            id: image1
            x: 133
            y: 13
            opacity: 0.1
            width: 138
            height: 100
            source: "background.png"

            SequentialAnimation {
                        id: anim1
                        PropertyAnimation {
                            target: image1
                            property: "opacity"
                            to: "0.4"
                            duration: 1
                        }

                        PropertyAnimation {
                             target: image1
                             property: "opacity"
                             to: "0.1"
                             duration: 1000
                                        }

                 }
        }

        Flickable {
            id: flickable
            anchors.fill: parent
            height: 50
            contentWidth: flickable.width; contentHeight: flickable.height * 2

        Text {
            id: qboxinput
            x: 0
            y: 18
            width: 400
            height: flickable.height
            color: "#ffffff"
            text: qsTr(" ")
            elide: Text.ElideMiddle
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            font.pixelSize: 12
            wrapMode: Text.WordWrap
        }
     }

        Flickable {
            id: flickable2
            anchors.fill: parent
            height: 50
            contentWidth: flickable2.width; contentHeight: flickable2.height * 2

        Text {
            id: qboxoutput
            x: 0
            y: 50
            width: 400
            height:flickable2.height
            color: "#ffffff"
            wrapMode: Text.WordWrap
            elide: Text.ElideMiddle
            text: KDEPlasmoidAdaptor.setTextFunctionSlot
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }
     }
 }

    Rectangle {
        id: rectanglebottombar
        x: 0
        y: 159
        width: 400
        height: 36
        color: "#1b1b1b"
        radius: 0
        border.color: "#80000000"
        border.width: 0

        TextField {
            id: qinput
            x: 1
            y: 4
            width: 280
            height: 27
            placeholderText: qsTr("Enter Query or Say 'Hey Mycroft'")
            onAccepted: {
                qboxinput.text = qinput.text
                submitTextField(qinput.text)
                senddbussignal("aQueryIsReady")
                qinput.text = ""
                anim1.running = true
            }
        }

        Button {
            id: qinputbutton
            x: 272
            y: 1
            width: 128
            height: 33
            text: qsTr("Enter Query")
            activeFocusOnPress: false
            iconSource: "appicon"

            MouseArea {
                id: mouseArea3
                x: 0
                y: 0
                width: 128
                height: 33
                hoverEnabled: false
                onClicked: {
                    qboxinput.text = qinput.text
                    submitTextField(qinput.text)
                    senddbussignal("aQueryIsReady")
                    qinput.text = ""
                    anim1.running = true
                }
            }
        }
    }

    Rectangle {
        id: rectangletopbar
        x: 0
        y: 0
        width: 400
        height: 37
        color: "#1d1d1d"
        border.width: 0
        border.color: "#80000000"

        Button {
            id: startmycservice
            x: 0
            y: 0
            width: 205
            height: 36
            text: qsTr("Start Mycroft Service")

            MouseArea {
                id: mouseArea1
                x: 0
                y: 0
                width: 205
                height: 36
                hoverEnabled: false
                onClicked: {
                    scriptLauncher.launchScript()
                    qboxinput.text = qsTr("Mycroft Services Have Started");
                    anim1.running = true
                }
            }
        }

        Button {
            id: stopmycservice
            x: 203
            y: 0
            width: 198
            height: 36
            text: qsTr("Stop Mycroft Service")

            MouseArea {
                id: mouseArea2
                x: 0
                y: 0
                width: 198
                height: 36
                hoverEnabled: false

                onClicked: {
                    scriptStopper.stopScript()
                    qboxinput.text = qsTr("Mycroft Services Have Stopped");
                    anim1.running = true
                }
            }
        }

    }

}

