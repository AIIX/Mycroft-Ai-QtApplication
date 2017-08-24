import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import Qt.labs.settings 1.0

Rectangle {
    id: rectangle1
    color: "#0e7f86"
    anchors.fill: parent
    property alias strscript: textField1.text
    property alias stpscript: textField2.text
    property alias wspath: textField3.text

    Item {
        id: settingstabcolumntop2

    }

    Item {
        id: settingstabcolumntop3
        anchors.top: settingstabcolumntop2.bottom
        anchors.topMargin: 71

        Switch {
            id: welcomeintroswitch
            x: 0
            y: -25
            height: 25
            text: qsTr("Enable / Disable Intro Animation")
            checked:  true

        }

    }


    Item {
        id: settingstabcolumnbottom
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: settingstabcolumntop3.bottom
        anchors.topMargin: 50

        Label {
            id: fontsizelabelfld
            x: 0
            y: -38
            text: qsTr("Text Font Size: ")
            font.bold: true
        }

        TextField {
            id: fontsizetextfld
            width: 28
            height: 46
            text: qsTr("12")
            anchors.left: fontsizelabelfld.right
            anchors.verticalCenter: fontsizelabelfld.verticalCenter
            anchors.leftMargin: 6
        }

        Button {
            id: button1
            width: 102
            height: 42
            text: qsTr("Apply")
            anchors.verticalCenterOffset: -33
            anchors.verticalCenter: fontsizetextfld.verticalCenter
            anchors.left: label2.right
            anchors.leftMargin: 177

            onClicked: {
                textinputsize = fontsizetextfld.text
            }
        }

        TextField {
            id: textField1
            width: 274
            height: 43
            text: qsTr("/home/Aix/mycroft-core/mycroft.sh")
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 162
            anchors.horizontalCenter: fontsizetextfld.horizontalCenter
            anchors.top: fontsizetextfld.bottom
            anchors.topMargin: 2
        }

        TextField {
            id: textField2
            width: 275
            height: 40
            text: qsTr("/home/Aix/mycroft-core/mycroft.sh")
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: textField1.horizontalCenter
            anchors.top: textField1.bottom
            anchors.topMargin: -1
        }

        TextField {
            id: textField3
            width: 273
            height: 40
            text: qsTr("ws://0.0.0.0:8181/core")
            anchors.horizontalCenterOffset: 1
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: textField1.horizontalCenter
            anchors.top: textField2.bottom
            anchors.topMargin: -3
        }

        Label {
            id: label1
            text: qsTr("Mycroft Start Script")
            font.bold: true
            anchors.top: fontsizelabelfld.bottom
            anchors.topMargin: 28
        }

        Label {
            id: label2
            x: -10
            text: qsTr("Mycroft Stop Script")
            font.bold: true
            anchors.horizontalCenter: label1.horizontalCenter
            anchors.top: label1.bottom
            anchors.topMargin: 14
        }

        Label {
            id: label3
            text: qsTr("Mycroft WS IP")
            textFormat: Text.AutoText
            font.bold: true
            anchors.top: label2.bottom
            anchors.topMargin: 18
        }

    }

    Settings {
        id: innerset
        property alias wsip: textField3.text
        property alias customlocstart: textField1.text
        property alias customlocstop: textField2.text
        property alias fntsize: fontsizetextfld.text
    }
}
