import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

Item {
    id: main
    width: 200
    height: 200
    signal message(string msg)

    Image {
        id: image1
        visible: true
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        source: "images/bluebg.png"

        Rectangle {
            id: rectanglequickitemmenu
            color: "#00000000"
            visible: true
            anchors.fill: parent

            Text {
                id: quickaccesslabel
                x: 51
                y: 5
                color: "#82b9ea"
                text: qsTr("Quick Access")
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 15
            }

            Rectangle {
                id: suggestion1button
                x: 10
                y: 30
                width: 30
                height: 30
                color: "#282525"
                radius: 15
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.horizontalCenterOffset: -75
                anchors.horizontalCenter: parent.horizontalCenter
                border.color: "#1a4878"
                border.width: 1
                z:100


                Component.onCompleted: {
                    print("MyItem Component.onCompleted")
                    main.message("signal sent");
                }

                Image {
                    id: image2
                    x: 82
                    y: 62
                    width: 16
                    height: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "images/weathericon.png"
                }

                Text {
                    id: suggestion1label
                    x: 40
                    y: 7
                    color: "#ffffff"
                    text: qsTr("Check The Weather")
                    anchors.verticalCenter: suggestion1button.verticalCenter
                    anchors.left: suggestion1button.right
                    anchors.leftMargin: 10
                    font.italic: false
                    font.family: "Verdana"
                    font.pixelSize: 13
                }

                MouseArea {
                    id: mouseArea1
                    x: 7
                    y: 7
                    anchors.fill: parent
                    hoverEnabled: true
                    Layout.fillWidth: true;
                    Layout.fillHeight: true;
                    onEntered: suggestion1button.border.color = "#fff"
                    onExited: suggestion1button.border.color = "#1a4878"
                    onClicked: main.message("What is the current Weather")
                }
            }

            Rectangle {
                id: suggestion2button
                x: 10
                y: 30
                width: 30
                height: 30
                color: "#282525"
                radius: 15
                anchors.top: suggestion1button.bottom
                anchors.topMargin: 10
                anchors.horizontalCenterOffset: -75
                anchors.horizontalCenter: parent.horizontalCenter
                border.color: "#1a4878"
                border.width: 1
                z:100


                Component.onCompleted: {
                    print("MyItem Component.onCompleted")
                    main.message("signal sent");
                }

                Image {
                    id: jokeimagebutton
                    x: 82
                    y: 62
                    width: 16
                    height: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "images/funnyface.png"
                }

                Text {
                    id: suggestion2label
                    x: 40
                    y: 7
                    color: "#ffffff"
                    text: qsTr("Ask Mycroft A Joke")
                    anchors.verticalCenter: suggestion2button.verticalCenter
                    anchors.left: suggestion2button.right
                    anchors.leftMargin: 10
                    font.italic: false
                    font.family: "Verdana"
                    font.pixelSize: 13
                }

                MouseArea {
                    id: mouseArea3
                    x: 7
                    y: 7
                    anchors.fill: parent
                    hoverEnabled: true
                    Layout.fillWidth: true;
                    Layout.fillHeight: true;
                    onEntered: suggestion2button.border.color = "#fff"
                    onExited: suggestion2button.border.color = "#1a4878"
                    onClicked: main.message("Tell me a joke")
                }
            }

            Rectangle {
                id: suggestion3button
                x: 10
                y: 30
                width: 30
                height: 30
                color: "#282525"
                radius: 15
                anchors.top: suggestion2button.bottom
                anchors.topMargin: 10
                anchors.horizontalCenterOffset: -75
                anchors.horizontalCenter: parent.horizontalCenter
                border.color: "#1a4878"
                border.width: 1
                z:100


                Component.onCompleted: {
                    print("MyItem Component.onCompleted")
                    main.message("signal sent");
                }

                Image {
                    id: reminderimagebutton
                    x: 82
                    y: 62
                    width: 16
                    height: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "images/reminder.png"
                }

                Text {
                    id: suggestion3label
                    x: 40
                    y: 7
                    color: "#ffffff"
                    text: qsTr("Set A Reminder")
                    anchors.verticalCenter: suggestion3button.verticalCenter
                    anchors.left: suggestion3button.right
                    anchors.leftMargin: 10
                    font.italic: false
                    font.family: "Verdana"
                    font.pixelSize: 13
                }

                MouseArea {
                    id: mouseArea4
                    x: 7
                    y: 7
                    anchors.fill: parent
                    hoverEnabled: true
                    Layout.fillWidth: true;
                    Layout.fillHeight: true;
                    onEntered: suggestion3button.border.color = "#fff"
                    onExited: suggestion3button.border.color = "#1a4878"
                    onClicked:  {
                                   rectanglereminderbox.visible = true
                                   rectanglequickitemmenu.visible = false
                               }
                }
            }

        }

        Rectangle {
            id: rectanglereminderbox
            width: 0
            height: 0
            color: "#00000000"
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            visible: false


            Text {
                id: text1
                color: "#ededed"
                text: qsTr("Date:")
                anchors.top: parent.top
                anchors.topMargin: 40
                anchors.horizontalCenterOffset: -75
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 13
            }

            Rectangle {
                id: rectanglereminderdateinputbox
                y: 0
                width: 117
                height: 20
                color: "#292424"
                anchors.verticalCenterOffset: 0
                anchors.verticalCenter: text1.verticalCenter
                anchors.left: text1.left
                anchors.leftMargin: 50

                TextField {
                    id: textInput1
                    text: "Text Field"
                    bottomPadding: 0
                    rightPadding: 0
                    leftPadding: 0
                    topPadding: 0
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }

            Text {
                id: text2
                color: "#ededed"
                text: qsTr("Time:")
                anchors.top: text1.bottom
                anchors.topMargin: 20
                anchors.horizontalCenterOffset: -75
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 13
            }

            Rectangle {
                id: rectangleremindertimeinputbox
                y: 0
                width: 117
                height: 20
                color: "#292424"
                anchors.verticalCenterOffset: 0
                anchors.verticalCenter: text2.verticalCenter
                anchors.left: text2.left
                anchors.leftMargin: 50

                TextField {
                    id: textInput2
                    text: qsTr("Text Field")
                    bottomPadding: 0
                    rightPadding: 0
                    leftPadding: 0
                    topPadding: 0
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }

            Button {
                id: button1
                height: 20
                text: qsTr("Set Reminder")
                anchors.horizontalCenter: rectangleremindertimeinputbox.horizontalCenter
                anchors.top: rectangleremindertimeinputbox.bottom
                anchors.topMargin: 25

                onClicked: {
                      main.message("Set A Reminder For"+" "+textInput1.text+" "+textInput2.text)
                        rectanglereminderbox.visible = false
                        rectanglequickitemmenu.visible = true

                }
            }
        }

    }

}
