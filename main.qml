import QtQuick 2.5
import QtQuick.Window 2.0
import QtQml.Models 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import Qt.WebSockets 1.0
import QtQuick.Controls.Material 2.0
import MycroftLauncher 1.0
import MsmInstaller 1.0
import MsmFileReader 1.0
import Qt.labs.settings 1.0

ApplicationWindow {
    id: root
    signal submitTextField(string text)
    signal senddbussignal(string text)
    minimumWidth: 450
    minimumHeight: 300
    visible: true
    color: "#1a1a1a"
    title: qsTr("Mycroft QtApplication")
    property alias cbwidth: rectangle2.width
    property var smintent
    property var dataContent
    property var skillList: []
    property alias strscript: textField1.text
    property alias stpscript: textField2.text
    property alias wspath: textField3.text

    Material.theme: Material.Dark
    Material.accent: Material.Cyan

    property bool fullscreen: false
    onFullscreenChanged: root.visibility = (fullscreen ? Window.FullScreen : Window.Windowed)

    function filterSpeak(msg){
            convoLmodel.append({
                "itemType": "NonVisual",
                "InputQuery": msg
            })
               inputlistView.positionViewAtEnd();
        }

        function filterincoming(intent, metadata) {
            var intentVisualArray = ['WeatherSkill:CurrentWeatherIntent'];
            var itemType

            if (intentVisualArray.indexOf(intent) !== -1) {
                    switch (intent){
                    case "WeatherSkill:CurrentWeatherIntent":
                        itemType = "CurrentWeather"
                        break;
                    }

                  convoLmodel.append({"itemType": itemType, "itemData": metadata})
                    }

            else {
                convoLmodel.append({"itemType": "WebViewType", "InputQuery": metadata.url})
            }
        }

        function clearList() {
                inputlistView.clear()
            }

        function getFileExtenion(filePath){
               var ext = filePath.split('.').pop();
               return ext;
        }

        function validateFileExtension(filePath) {
                      var ext = filePath.split('.').pop();
                      return ext === "jpg" || ext === "png" || ext === "jpeg" || ext === 'mp3' || ext === 'wav' || ext === 'mp4'
        }

        function getSkillByName(skillName){
            var tempSN=[];
            for(var i = 0; i <skillList.length;i++){
                var sList = skillList[i].name;
                if(sList.indexOf(skillName) !== -1){
                    tempSN.push(skillList[i]);
                }
            }
            return tempSN;
        }

        function getSkills() {
          var doc = new XMLHttpRequest()
          var url = "https://raw.githubusercontent.com/MycroftAI/mycroft-skills/master/.gitmodules"
          doc.open("GET", url, true);
          doc.send();

          doc.onreadystatechange = function() {
            if (doc.readyState === XMLHttpRequest.DONE) {
              var path, list;
              var tempRes = doc.responseText
              var moduleList = tempRes.split("[");
              for (var i = 1; i < moduleList.length; i++) {
                path = moduleList[i].substring(moduleList[i].indexOf("= ") + 2, moduleList[i].indexOf("url")).replace(/^\s+|\s+$/g, '');
                url = moduleList[i].substring(moduleList[i].search("url =") + 6).replace(/^\s+|\s+$/g, '');
                skillList[i-1] = {"name": path, "url": url};
                msmskillsModel.reload();
              }
            }
          }
        }

        function refreshAllSkills(){
            getSkills();
            msmskillsModel.reload();
        }

        function getAllSkills(){
            if(skillList.length <= 0){
                getSkills();
            }
            return skillList;
        }

    ScriptLauncher { id: myLauncher }
    FileReader {id: myReader }
    MsmApp {id: launchinstaller }

    WebSocket {
        id: socket
        url: innerset.wsip
        onTextMessageReceived: {
            var somestring = JSON.parse(message)
                        var msgType = somestring.type;
                        qinput.focus = false;

                        if (msgType === "recognizer_loop:utterance") {
                            var intpost = somestring.data.utterances;
                            qinput.text = intpost.toString()
                            midbarAnim.wsistalking()
                        }

                        if (somestring && somestring.data && typeof somestring.data.intent_type !== 'undefined'){
                            smintent = somestring.data.intent_type;
                            console.log('intent type: ' + smintent);
                        }

                        if(somestring && somestring.data && typeof somestring.data.utterance !== 'undefined' && somestring.type === 'speak'){
                            filterSpeak(somestring.data.utterance);
                        }

                        if(somestring && somestring.data && typeof somestring.data.desktop !== 'undefined') {
                            dataContent = somestring.data.desktop
                            filterincoming(smintent, dataContent)
                        }

                        midbarAnim.wsistalking()
        }

        onStatusChanged: if (socket.status == WebSocket.Error) {
                                 connectws.text = "Error"
                                 connectws.color = "red"
                                 startmycservice.circolour = "red"
                          } else if (socket.status == WebSocket.Open) {
                                 connectws.text = "Ready"
                                 connectws.color = "green"
                                 startmycservice.circolour = "green"
                          } else if (socket.status == WebSocket.Closed) {
                                 connectws.text = "Closed"
                                 connectws.color = "white"
                          } else if (socket.status == WebSocket.Connecting) {
                                 connectws.text = "Starting.."
                                 connectws.color = "white"
                          } else if (socket.status == WebSocket.Closing) {
                                 connectws.text = "Shutting.."
                                 connectws.color = "blue"
                                 startmycservice.circolour = "#1e4e62"
                          }


        active: false
    }

    Timer {
           id: timer
       }

    function delay(delayTime, cb) {
               timer.interval = delayTime;
               timer.repeat = false;
               timer.triggered.connect(cb);
               timer.start();
           }

     Rectangle {
        id: rectangleresultbox
        x: 0
        y: 38
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rectangletopbar.bottom
        anchors.bottom: rectanglebottombar.top
        color: "#1d1d1d"
        border.color: "#80000000"
        border.width: 0
        visible: true

        SwipeView  {
            id: swipeView
            width: parent.width
            currentIndex: bar.currentIndex
            anchors.fill: parent

        Page {
        id: homeTab

        Loader {
            id: welcomewidgetloader
            anchors.fill: parent
            visible: true;
            active: true;
            focus: true;
            source: "Welcome.qml"
            z: 100;

            MouseArea {
                anchors.fill: parent
                onDoubleClicked: {
                welcomewidgetloader.visible = false;
                }
            }
        }

        Flickable {
            id: rect2flickable
            anchors.fill: parent
            contentHeight: parent.height
            contentWidth: parent.width

        Rectangle {
           id: rectangle2
           color: "#1d1d1d"
           anchors.fill: parent

        DropArea {
               anchors.fill: parent;
               id: dragTarget
               onEntered: {
                for(var i = 0; i < drag.urls.length; i++)
                    if(validateFileExtension(drag.urls[i]))
                    return
                    console.log("No valid files, refusing drag event")
                    drag.accept()
                    dragTarget.enabled = false
               }

               onDropped: {
                for(var i = 0; i < drop.urls.length; i++){
                var ext = getFileExtenion(drop.urls[i]);
                if(ext === "jpg" || ext === "png" || ext === "jpeg"){
                   var durl = String(drop.urls[i]);
                   console.log(durl)
                   convoLmodel.append({
                       "itemType": "DropImg",
                       "InputQuery": durl
                       })
                       inputlistView.positionViewAtEnd();


                   var irecogmsgsend = innerset.customrecog
                   var socketmessage = {};
                   socketmessage.type = "recognizer_loop:utterance";
                   socketmessage.data = {};
                   socketmessage.data.utterances = [irecogmsgsend + " " + durl];
                   socket.sendTextMessage(JSON.stringify(socketmessage));
                   console.log(irecogmsgsend + " " + durl);
                    }

                if(ext === 'mp3'){
                    console.log('mp3');
                    }
                }
            }


               ListModel{
               id: convoLmodel
               }

                Rectangle {
                    id: messageBox
                    anchors.fill: parent
                    anchors.right: dragTarget.right
                    anchors.left: dragTarget.left
                    color: "#222"

                    ColumnLayout {
                        id: colconvo
                        anchors.fill: parent

                    ListView {
                        id: inputlistView
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        verticalLayoutDirection: ListView.TopToBottom
                        spacing: 12
                        model: convoLmodel
                        //ScrollBar.vertical: ScrollBar {}
                        delegate:  Component {
                                   Loader {
                                       source: switch(itemType) {
                                               case "NonVisual": return "SimpleMessageType.qml"
                                               case "WebViewType": return "WebViewType.qml"
                                               case "CurrentWeather": return "CurrentWeatherType.qml"
                                               case "DropImg" : return "ImgRecogType.qml"
                                               }
                                        property var metacontent : dataContent
                                       }
                               }

                    onCountChanged: {
                        inputlistView.positionViewAtEnd();
                                    }
                                        }
                                            }
                                                }
                                                    }
                                                        }
                                                           }
                                                                 }

        Page {
        id: hintTab
        Rectangle {
           id: rectangle2hints
           color: "#1d1d1d"
           anchors.fill: parent

           Rectangle {
                   anchors.top: rectangle2hints.top
                   anchors.left: rectangle2hints.left
                   anchors.right: rectangle2hints.right
                   id: skillsrectmain
                   color: "#222"

               Component {
                       id: skillDelegate
                       Rectangle {
                           id: skillcontent
                           Layout.fillWidth: true;
                           anchors { left: parent.left; right: parent.right }
                           height: 80
                           border.width: 0
                           border.color: "lightsteelblue"
                           radius: 2
                           color: "#222"
                           z: -99

                           RowLayout {
                           id: skillTopRowLayout
                           spacing: 5
                           anchors.fill: parent

                           Label {
                               id: innerskllname
                               anchors.top: parent.top
                               anchors.topMargin: 2
                               anchors.left: parent.left
                               anchors.right: parent.right
                               wrapMode: Text.WordWrap;
                               font.bold: true;
                               text: qsTr('<b>Skill:</b>' + Skill)
                           }

                           Rectangle {
                               id: skilltipsimage
                               anchors.left: parent.left
                               anchors.top: innerskllname.bottom
                               anchors.bottom: parent.bottom
                               width: 16
                               color: "#222"

                           Image {
                            id: innerskImg
                            source: Pic
                            width: 16
                            height: 16
                            anchors.centerIn: parent
                               }
                           }

                           Rectangle {
                           id: skilltipsinner
                           anchors.left: skilltipsimage.right
                           anchors.leftMargin: 10
                           anchors.right: parent.right
                           color: "#222"
                           anchors.top: innerskllname.bottom
                           anchors.bottom: parent.bottom

                           Column{
                               id: innerskillscolumn
                               spacing: 2

                           Label {wrapMode: Text.WordWrap; width: root.width; text: qsTr('<b>Command:</b> ' + CommandList.get(0).Commands)}
                           Label {wrapMode: Text.WordWrap; width: root.width; text: qsTr('<b>Command:</b> ' + CommandList.get(1).Commands)}
                               }
                                   }
                                       }
                                           }
                                               }
                                                   }

                       ListView {
                           id: skillslistmodelview
                           anchors.top: parent.top
                           anchors.topMargin: 5
                           anchors.left: parent.left
                           anchors.right: parent.right
                           anchors.bottom: parent.bottom
                           model: SkillModel{}
                           delegate: skillDelegate
                           spacing: 4
                           focus: false
                           interactive: true
                           clip: true;
                       }

            }
        }

        Page {
        id: settingspage

        Rectangle {
            id: rectangle1
            color: "#1e4e62"
            anchors.fill: parent

            Flickable {
                id: rect1flickable
                anchors.fill: parent
                contentHeight: parent.height + 150
                contentWidth: parent.width

            Item {
                id: settingstabcolumntop3
                anchors.top: parent.top
                anchors.topMargin: 40

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

                TextField {
                    id: textField4
                    width: 273
                    height: 40
                    text: qsTr("/home/aix/mycroft-core/msm/msm")
                    anchors.horizontalCenterOffset: 1
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: textField1.horizontalCenter
                    anchors.top: textField3.bottom
                    anchors.topMargin: -3
                }

                TextField {
                    id: textField5
                    width: 273
                    height: 40
                    text: qsTr("search image url")
                    anchors.horizontalCenterOffset: 1
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: textField1.horizontalCenter
                    anchors.top: textField4.bottom
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

                Label {
                    id: label4
                    text: qsTr("MSM Installer Script")
                    textFormat: Text.AutoText
                    font.bold: true
                    anchors.top: label3.bottom
                    anchors.topMargin: 18
                    }

                Label {
                    id: label5
                    text: qsTr("Custom Recognition")
                    textFormat: Text.AutoText
                    font.bold: true
                    anchors.top: label4.bottom
                    anchors.topMargin: 18
                    }

                }
            }
            Settings {
                id: innerset
                property alias wsip: textField3.text
                property alias customlocstart: textField1.text
                property alias customlocstop: textField2.text
                property alias fntsize: fontsizetextfld.text
                property alias msmloc: textField4.text
                property alias customrecog: textField5.text
                }
            }

        }

        Page {
        id: installerPage

        Item {
            id: msmtabtopbar
            width: parent.width
            anchors.left: parent.left
            anchors.right: parent.right
            height: 50

            TextField {
            id: msmsearchfld
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.bottom: parent.bottom
            anchors.right: getskillsbx.left
            placeholderText: qsTr("Search Skills")

            onTextChanged: {
            if(text.length > 0 ) {
                msmskillsModel.applyFilter(text.toLowerCase());
            } else {
                msmskillsModel.reload();
            }
        }
    }

        ToolButton {
                id: getskillsbx
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                text: "\u27F3"
                flat: true
                width: Math.round(30)
                height: width
                z: 102

                onClicked: {
                        msmskillsModel.clear();
                        refreshAllSkills();
                    }
                }
        }

        ListModel {
            id: msmskillsModel

            Component.onCompleted: {
                reload();
                //console.log('Completing too early?');
            }

             function reload() {
                var skList = getAllSkills();
                msmskillsModel.clear();
                for( var i=0; i < skList.length ; ++i ) {
                    msmskillsModel.append(skList[i]);
                }
            }

            function applyFilter(skName) {
                var skList = getSkillByName(skName);
                msmskillsModel.clear();
                for( var i=0; i < skList.length ; ++i ) {
                    msmskillsModel.append(skList[i]);
                }
            }
        }

        ListView {
            id: msmlistView
            anchors.top: msmtabtopbar.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            model: msmskillsModel
            delegate: MsmView{}
            spacing: 4
            focus: false
            interactive: true
            clip: true;
            }


        }

    }
}

    footer: Rectangle {
        id: rectanglebottombar
        //anchors.bottom: parent.bottom
        width: parent.width
        height: 40
        color: "#1b1b1b"
        radius: 0
        border.color: "#80000000"
        border.width: 0

        TextField {
            id: qinput
            anchors.left: parent.left
            anchors.right: qinputbutton.left
            height: parent.height
            placeholderText: qsTr("Enter Query or Say 'Hey Mycroft'")
            onAccepted: {
                rectangleresultbox.visible = true;
                var socketmessage = {};
                socketmessage.type = "recognizer_loop:utterance";
                socketmessage.data = {};
                socketmessage.data.utterances = [qinput.text];
                socket.sendTextMessage(JSON.stringify(socketmessage));
            }
        }

        Button {
            id: qinputbutton
            width: 150
            anchors.right: parent.right
            height: parent.height
            text: qsTr("Enter Query")
            //Material.theme: Material.Dark

            MouseArea {
                id: mouseArea3
                x: 0
                y: 0
                width: 128
                height: 33
                hoverEnabled: false
                onClicked: {
                    rectangleresultbox.visible = true;
                    var socketmessage = {};
                    socketmessage.type = "recognizer_loop:utterance";
                    socketmessage.data = {};
                    socketmessage.data.utterances = [qinput.text];
                    socket.sendTextMessage(JSON.stringify(socketmessage));
                }
            }
        }
    }

    header: Rectangle {
        id: rectangletopbar
        anchors.left: parent.left
        anchors.right: parent.right
        height: 37
        color: "#1d1d1d"
        border.width: 0
        border.color: "#80000000"

        Button {
            id: fullscreenbutton
            anchors.left: parent.left
            anchors.leftMargin: 2
            width: 32
            height: 36
            onClicked: fullscreen = !fullscreen

            Image {
                id: fullscreenimg
                source: "images/view-fullscreen.svg"
                width: 16
                height: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }


        SwitchButton {
            id: startmycservice
            checked: false
            height: 36
            anchors.left: fullscreenbutton.right
            anchors.leftMargin: 5

            onClicked: {
            if (startmycservice.checked === true) {
                var strt = innerset.customlocstart + " " + "start"
                //console.log(strt)
                myLauncher.launchScript(strt)
                welcomewidgetloader.active = false;
                delay(12000, function() {
                socket.active = true
                })
            }
            if (startmycservice.checked === false) {
                var stpsc = innerset.customlocstop + " " + "stop"
                myLauncher.launchScript(stpsc)
                welcomewidgetloader.active = true;
                socket.active = false
                }
            }
        }

        Rectangle {
        id: seperaterlinea
        width: 1
        anchors.left: startmycservice.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 5
        color: "#99cccccc"
        }

        Text {
            id: connectws
            x: 304
            y: 0
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: seperaterlinea.right
            anchors.leftMargin: 10
            color: "#ffffff"
            height: 36
            text: qsTr("Disabled")
            }

        Rectangle {
        id: seperaterlineb
        width: 1
        anchors.left: connectws.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 10
        color: "#99cccccc"
        }

        TopBarAnim {
            id: midbarAnim
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 7
            anchors.left: seperaterlineb.left
            anchors.right: bar.right
            height: parent.height
        }

        TabBar {
            id: bar
            width: 138
            anchors.right: parent.right
            height: 36
            currentIndex: swipeView.currentIndex

            TabButton {
                width: 32
                height: 36
                Image {
                    id: tabimage1
                    source: "images/home.svg"
                    width: 16
                    height: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
               }

            TabButton {
                width: 32
                height: 36

                Image {
                    id: tabimage2
                    source: "images/hint.svg"
                    width: 16
                    height: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            TabButton {
                width: 32
                height: 36
                Image {
                    id: tabimage3
                    source: "images/settings.svg"
                    width: 16
                    height: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            TabButton {
                width: 32
                height: 36
                Image {
                    id: tabimage4
                    source: "images/installer.svg"
                    width: 16
                    height: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                }
            }
        }



 }

