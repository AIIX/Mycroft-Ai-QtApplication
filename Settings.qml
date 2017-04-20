import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id: rectangle1
    color: "#0e884b"
    anchors.fill: parent
    property alias strscript: textField1.text
    property alias stpscript: textField2.text

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
            width: 36
            height: 26
            text: qsTr("12")
            anchors.left: fontsizelabelfld.right
            anchors.verticalCenter: fontsizelabelfld.verticalCenter
            anchors.leftMargin: 10
        }

        Button {
            id: button1
            width: 100
            height: 18
            text: qsTr("Apply")
            anchors.verticalCenterOffset: -42
            anchors.verticalCenter: fontsizetextfld.verticalCenter
            anchors.left: label2.right
            anchors.leftMargin: 177

            onClicked: {
                textinputsize = fontsizetextfld.text
            }
        }

        TextField {
            id: textField1
            width: 262
            height: 26
            text: qsTr("/home/Aix/mycroft-core/mycroft.sh")
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 140
            anchors.horizontalCenter: fontsizetextfld.horizontalCenter
            anchors.top: fontsizetextfld.bottom
            anchors.topMargin: 14
        }

        TextField {
            id: textField2
            width: 263
            height: 25
            text: qsTr("/home/Aix/mycroft-core/mycroft.sh")
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: textField1.horizontalCenter
            anchors.top: textField1.bottom
            anchors.topMargin: 10
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
    }
}
