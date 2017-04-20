import QtQuick 2.0

Item {
  anchors.fill: parent
  property alias currentweatherparam: weatherwidgetcurrenttemp.text
  property alias highweatherparam: weatherwidgethightemp.text
  property alias lowweatherparam: weatherwidgetlowtemp.text
  property alias forcasttext: weatherwidgetcurrenttemplabel.text
  property alias forcastdegree: weatherwidgetcurrenttempdegrees.text
  property alias weatherbackgroundimage: weatheranimation.source

    Image {
        id: imageweatherbackground
        anchors.fill: parent
        //source: "bluesky.png"

        AnimatedImage {
         id: weatheranimation
         anchors.fill: parent
         source: "images/clearsky.gif"
        }

        Rectangle {
        id: bgweatherlayer
        anchors.fill: parent
        color: "#80000000"

        Rectangle {
            id: weatherwidgetrectangletop
            color: "#00000000"
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0

            Text {
                id: weatherwidgetcurrenttemp
                color: "#ffffff"
                text: qsTr(" ");
                anchors.top: parent.top
                anchors.topMargin: 30
                font.bold: true
                font.italic: false
                font.family: "Courier"
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0

                font.pixelSize: 83

                Text {
                    id: weatherwidgetcurrenttempdegrees
                    color: "#ffffff"
                    text: qsTr("°")
                    font.family: "Courier"
                    styleColor: "#ffeeee"
                    anchors.verticalCenterOffset: -15
                    horizontalAlignment: Text.AlignHCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 115
                    font.pixelSize: 34
                }
            }

            Text {
                id: weatherwidgetcurrenttemplabel
                color: "#ffffff"
                text: qsTr("Current Weather")
                anchors.right: parent.right
                anchors.rightMargin: 0
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
                font.pixelSize: 26
            }
        }

        Rectangle {
            id: weatherwidgetrectanglebottom
            height: 220
            color: "#00000000"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            Rectangle {
                id: weatherwidgetrectanglebottomleft
                color: "#00000000"
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 320
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0

                Text {
                    id: weatherwidgethightemp
                    color: "#ffffff"
                    text: qsTr(" ")
                    horizontalAlignment: Text.AlignHCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    font.pixelSize: 40

                    Text {
                        id: weatherwidgethightempdegree
                        color: "#ffffff"
                        text: qsTr("°")
                        font.family: "Courier"
                        styleColor: "#ffeeee"
                        anchors.verticalCenterOffset: 0
                        horizontalAlignment: Text.AlignHCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 80
                        font.pixelSize: 34
                    }
                }

                Text {
                    id: weatherwidgethightemplabel
                    color: "#ffffff"
                    text: qsTr("HIGH")
                    font.family: "Courier"
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    anchors.top: parent.top
                    anchors.topMargin: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    font.pixelSize: 28
                }
            }

            Rectangle {
                id: weatherwidgetrectanglebottomright
                color: "#00000000"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: weatherwidgetrectanglebottomleft.right
                anchors.leftMargin: 100

                Text {
                    id: weatherwidgetlowtemp
                    color: "#ffffff"
                    text: qsTr(" ")
                    horizontalAlignment: Text.AlignHCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    font.pixelSize: 40

                    Text {
                        id: weatherwidgetlowtempdegree
                        color: "#ffffff"
                        text: qsTr("°")
                        font.family: "Courier"
                        styleColor: "#ffeeee"
                        anchors.verticalCenterOffset: 0
                        horizontalAlignment: Text.AlignHCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 80
                        font.pixelSize: 34
                    }
                }

                Text {
                    id: weatherwidgetlowtemplabel
                    color: "#ffffff"
                    text: qsTr("LOW")
                    font.family: "Courier"
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    anchors.top: parent.top
                    anchors.topMargin: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    font.pixelSize: 28
                    }
                }
            }
        }
    }
}
