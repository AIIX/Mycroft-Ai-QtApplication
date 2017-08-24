import QtQuick 2.5

Rectangle {
color: "#e63d8ac6"

Image {
    anchors.fill: parent
    source: "images/whitespace.jpg"

    Rectangle {
        id: rectangle1
        width: parent.width / 7
        color: "#00000000"
        anchors.right: rectangle2.left
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Image {
            id: image5anim
            width: 100
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "images/mleftsmallanim.png"
        }
    }

    Rectangle {
        id: rectangle2
        width: parent.width / 7
        color: "#00000000"
        anchors.right: rectangle3.left
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Image {
            id: image3anim
            width: 100
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 160
            anchors.top: parent.top
            anchors.topMargin: 160
            anchors.horizontalCenter: parent.horizontalCenter
            sourceSize.width: 0
            fillMode: Image.PreserveAspectFit
            source: "images/mleftmidanim.png"
        }

    }

    Rectangle {
        id: rectangle3
        width: parent.width / 7
        color: "#00000000"
        anchors.right: rectangle4.left
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Image {
            id: image1anim
            width: 100
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            source: "images/mleftanim.png"
        }
    }

    Rectangle {
        id: rectangle4
        width: parent.width / 7
        color: "#00000000"
        anchors.right: rectangle5.left
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    Rectangle {
        id: rectangle5
        width: parent.width / 7
        color: "#00000000"
        anchors.right: rectangle6.left
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Image {
            id: image2anim
            width: 100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            rotation: 180
            fillMode: Image.PreserveAspectFit
            source: "images/mleftanim.png"
        }
    }

    Rectangle {
        id: rectangle6
        width: parent.width / 7
        color: "#00000000"
        anchors.right: rectangle7.left
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Image {
            id: image4anim
            width: 100
            anchors.bottomMargin: 160
            anchors.topMargin: 160
            rotation: 180
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            fillMode: Image.PreserveAspectFit
            source: "images/mleftmidanim.png"
        }
    }

    Rectangle {
        id: rectangle7
        width: parent.width / 7
        color: "#00000000"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Image {
            id: image6anim
            width: 100
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            rotation: 180
            fillMode: Image.PreserveAspectFit
            source: "images/mleftsmallanim.png"
        }
    }

    Image {
        id: image7anim
        width: 100
        height: 100
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "images/mmidanim.png"
    }

    Text{
        id : idText
        height : parent.height
        color: "#ffffff"
        text : "Get Current Weather Stats"
        anchors.verticalCenterOffset: -40
        anchors.verticalCenter: idText3.verticalCenter
        font.family: "Courier"
        font.pointSize: 18
        style: Text.Normal;

        SequentialAnimation {
            running: true
            NumberAnimation { target: idText; property: "x"; to: idText.width * 4;  easing.type: Easing.Linear; duration: 7000 }
            NumberAnimation { target: idText; property: "x"; to: idText.width / 4 * -8; duration: 7000 }
            loops: Animation.Infinite
        }

    }

    Text{


        id : idText2
        height : parent.height
        color: "#ffffff"
        text : "Ask Questions"
        anchors.verticalCenterOffset: 100
        anchors.verticalCenter: parent.verticalCenter
        font.family: "Courier"
        font.pointSize: 18
        style: Text.Normal;

        SequentialAnimation {
            running: true
            NumberAnimation { target: idText2; property: "x"; to: idText.width / 4 * -8; duration: 7000 }
            NumberAnimation { target: idText2; property: "x"; to: idText.width * 4; duration: 7000 }
            loops: Animation.Infinite
        }

    }

    Text{


        id : idText3
        height : parent.height
        color: "#ffffff"
        text : "Find Answers"
        anchors.verticalCenterOffset: 175
        anchors.verticalCenter: parent.verticalCenter
        font.family: "Courier"
        font.pointSize: 18
        style: Text.Normal;

        SequentialAnimation {
            running: true
            NumberAnimation { target: idText3; property: "x"; to: idText.width * 3; duration: 7000 }
            NumberAnimation { target: idText3; property: "x"; to: idText.width / 3 * -8; duration: 7000 }
            loops: Animation.Infinite
        }

    }

    Text{


        id : idText4
        height : parent.height
        color: "#ffffff"
        text : "Discover Information"
        anchors.verticalCenterOffset: -75
        anchors.verticalCenter: idText.verticalCenter
        font.family: "Courier"
        font.pointSize: 18
        style: Text.Normal;

        SequentialAnimation {
            running: true
            NumberAnimation { target: idText4; property: "x"; to: idText.width / 5 * -8; duration: 6000 }
            NumberAnimation { target: idText4; property: "x"; to: idText.width * 5; duration: 6000 }
            loops: Animation.Infinite
        }

    }


    Rectangle {
        id: testanimid2
        color: "#00000000"
        rotation: 90
        anchors.left: parent.left
        anchors.leftMargin: 125

        Text{


            id : idText5
            height : parent.height
            color: "#ffffff"
            text : "Set Reminders"
            font.family: "Courier"
            font.pointSize: 18
            style: Text.Normal;

        }
        SequentialAnimation {
            running: true
            NumberAnimation { target: testanimid2; property: 'y'; from: idText.width / 4 * -8; to: idText.width * 4; duration: 7000 }
            NumberAnimation { target: testanimid2; property: 'anchors.leftMargin'; from: idText.width / 4; to: idText.width / 2; duration: 10 }
            NumberAnimation { target: testanimid2; property: 'rotation'; from: 90; to: -90; duration: 10 }
            NumberAnimation { target: testanimid2; property: 'y'; from: idText.width * 4; to: idText.width / 4 * -8; duration: 7000 }
            NumberAnimation { target: testanimid2; property: 'rotation'; from: -90; to: 90; duration: 10 }
            NumberAnimation { target: testanimid2; property: 'anchors.leftMargin'; from: idText.width / 2; to: idText.width / 4; duration: 10 }

            loops: Animation.Infinite
        }

    }

    Rectangle {
        id: testanimid3
        color: "#00000000"
        rotation: -90
        anchors.left: parent.left
        anchors.leftMargin: 225

        Text{


            id : idText6
            height : parent.height
            color: "#ffffff"
            text : "Easy Calculations"
            font.family: "Courier"
            font.pointSize: 18
            style: Text.Normal;

        }

        SequentialAnimation {
            running: true
            NumberAnimation { target: testanimid3; property: 'y'; from: idText.width * 4; to: idText.width / 4 * -8; duration: 7000 }
            NumberAnimation { target: testanimid3; property: 'anchors.leftMargin'; from: idText.width / 2 * 5; to: idText.width / 12; duration: 10 }
            NumberAnimation { target: testanimid3; property: 'rotation'; from: -90; to: 90; duration: 10 }
            NumberAnimation { target: testanimid3; property: 'y'; from: idText.width / 4 * -8; to: idText.width * 4; duration: 7000 }
            NumberAnimation { target: testanimid3; property: 'rotation'; from: 90; to: -90; duration: 10 }
            NumberAnimation { target: testanimid3; property: 'anchors.leftMargin'; from: idText.width / 12; to: idText.width * 2 / 5; duration: 10 }

            loops: Animation.Infinite
        }

    }

    Rectangle {
        id: testanimid4
        color: "#00000000"
        rotation: -90
        anchors.left: parent.left
        anchors.leftMargin: 50

        Text{


            id : idText7
            height : parent.height
            color: "#ffffff"
            text : "Latest Stock Prices"
            font.family: "Courier"
            font.pointSize: 18
            style: Text.Normal;

        }

        SequentialAnimation {
            running: true
            NumberAnimation { target: testanimid4; property: 'y'; from: idText.width * 7; to: idText.width / 6 * -5; duration: 8500 }
            NumberAnimation { target: testanimid4; property: 'anchors.leftMargin'; from: idText.width / 3; to: idText.width / 7; duration: 10 }
            NumberAnimation { target: testanimid4; property: 'rotation'; from: -90; to: 90; duration: 10 }
            NumberAnimation { target: testanimid4; property: 'y'; from: idText.width / 6 * -8; to: idText.width * 6; duration: 6500 }
            NumberAnimation { target: testanimid4; property: 'rotation'; from: 90; to: -90; duration: 10 }
            NumberAnimation { target: testanimid4; property: 'anchors.leftMargin'; from: idText.width / 7; to: idText.width / 3; duration: 10 }

            loops: Animation.Infinite
        }

    }

    SequentialAnimation{
        running: true
        loops: Animation.Infinite
        SequentialAnimation {
            ParallelAnimation {
                NumberAnimation { target: image5anim; property: 'opacity'; from: 0.1; to: 1; duration: 1000 }
                NumberAnimation { target: image6anim; property: 'opacity'; from: 0.1; to: 1; duration: 1000 }
            }
            ParallelAnimation{
                NumberAnimation { target: image3anim; property: 'opacity'; from: 0.1; to: 1; duration: 1500 }
                NumberAnimation { target: image4anim; property: 'opacity'; from: 0.1; to: 1; duration: 1500 }
            }
            ParallelAnimation{
                NumberAnimation { target: image1anim; property: 'opacity'; from: 0.1; to: 1; duration: 2000 }
                NumberAnimation { target: image2anim; property: 'opacity'; from: 0.1; to: 1; duration: 2000 }
            }
            NumberAnimation { target: image7anim; property: 'opacity'; from: 0.1; to: 0.6; duration: 2000 }

        }

        SequentialAnimation {
            ParallelAnimation {
                NumberAnimation { target: image5anim; property: 'opacity'; from: 1; to: 0.1; duration: 1000 }
                NumberAnimation { target: image6anim; property: 'opacity'; from: 1; to: 0.1; duration: 1000 }
            }
            ParallelAnimation{
                NumberAnimation { target: image3anim; property: 'opacity'; from: 1; to: 0.1; duration: 1500 }
                NumberAnimation { target: image4anim; property: 'opacity'; from: 1; to: 0.1; duration: 1500 }
            }
            ParallelAnimation{
                NumberAnimation { target: image1anim; property: 'opacity'; from: 1; to: 0.1; duration: 2000 }
                NumberAnimation { target: image2anim; property: 'opacity'; from: 1; to: 0.1; duration: 2000 }
            }
            NumberAnimation { target: image7anim; property: 'opacity'; from: 0.6; to: 0.1; duration: 2000 }

        }

    }

 }
}
