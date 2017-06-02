import QtQuick 2.0
import QtQml.Models 2.2
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import Qt.WebSockets 1.0
import QtQuick.Controls.Styles 1.4 
import MycroftLauncher 1.0

ApplicationWindow {
    id: root
    signal submitTextField(string text)
    signal senddbussignal(string text)
    minimumWidth: 450
    minimumHeight: 250
    maximumHeight: minimumHeight
    maximumWidth: minimumWidth
    visible: true
    color: "#1a1a1a"
    title: qsTr("Mycroft QtApplication")
    property alias textinputsize: qboxoutput.font.pixelSize

    ScriptLauncher { id: myLauncher }

    WebSocket {
        id: socket
        url: settingswidgetloader.wspath
        onTextMessageReceived: {
            //console.log(message)
            var somestring = JSON.parse(message)
            var msgType = somestring.type;
            if (msgType === "speak") {
                var post = somestring.data.utterance;
                var componentweather = Qt.createComponent("Weather.qml")
                var loadwin = componentweather.createObject(weatherloader)

                var componentstock = Qt.createComponent("Stockwidget.qml")
                var loadstock = componentstock.createObject(stockwidgetloader)
                suggestionswidgetloader.visible = false;

                //console.log(post)
                qboxoutput.text = post;
                if (qboxoutput.text.indexOf("Register") != -1 && qboxoutput.text.indexOf("your") != -1 || qboxoutput.text.indexOf("Log") != -1 && qboxoutput.text.indexOf("in") != -1){
                    regisbutton.visible=true;
                }
                else {
                    regisbutton.visible=false;
                }

                if (qboxoutput.text.indexOf("With") != -1 && qboxoutput.text.indexOf("a") != -1 && qboxoutput.text.indexOf("high") && qboxoutput.text.indexOf("of") != -1 && qboxoutput.text.indexOf("degrees") != -1) {
                                    var totalnumbclimstatementa = qboxoutput.text.match(/\d/g)

                                    var hightempclimstatementa = totalnumbclimstatementa.toString().substring(0, 3)
                                    hightempclimstatementa = hightempclimstatementa.replace(/\,/g,"")
                                    //console.log(hightempclimstatementa)

                                    var lowtempclimstatementa = totalnumbclimstatementa.toString().substring(4,7)
                                    lowtempclimstatementa = lowtempclimstatementa.replace(/\,/g,"")
                                    //console.log(lowtempclimstatementa)

                                    var currenttempclimstatementa = totalnumbclimstatementa.toString().substring(8,11)
                                    currenttempclimstatementa = currenttempclimstatementa.replace(/\,/g,"")
                                    //console.log(currenttempclimstatementa)

                                    loadwin.currentweatherparam = currenttempclimstatementa
                                    loadwin.highweatherparam = hightempclimstatementa
                                    loadwin.lowweatherparam = lowtempclimstatementa
                                    weatherloader.visible = true;
                                    qboxoutput.visible = false;

                                    if (currenttempclimstatementa <= "60") {
                                        loadwin.weatherbackgroundimage = "images/snow.gif"
                                    }

                                    else if (currenttempclimstatementa <= "60" && qboxoutput.text.indexOf("mist") != -1 || qboxoutput.text.indexOf("light") != -1 && qboxoutput.text.indexOf("intensity") != -1 && qboxoutput.text.indexOf("drizzle") != -1) {
                                            loadwin.weatherbackgroundimage = "images/rain.gif"
                                    }

                                    else if (currenttempclimstatementa >= "61") {
                                        loadwin.weatherbackgroundimage = "images/clearsky.gif"
                                    }

                                    else if (currenttempclimstatementa >= "61" && qboxoutput.text.indexOf("mist") != -1 || qboxoutput.text.indexOf("light") != -1 && qboxoutput.text.indexOf("intensity") != -1 && qboxoutput.text.indexOf("drizzle") != -1) {
                                            loadwin.weatherbackgroundimage = "images/rain.gif"
                                    }

                                }

                else if (qboxoutput.text.indexOf("It's") != -1 && qboxoutput.text.indexOf("currently") != -1 && qboxoutput.text.indexOf("degrees") != -1 && qboxoutput.text.indexOf("Today's") != -1 && qboxoutput.text.indexOf("forecast") != -1 && qboxoutput.text.indexOf("high") != -1 && qboxoutput.text.indexOf("low") != -1) {

                                    var totalnumbclimstatementb = qboxoutput.text.match(/\d/g)

                                    var hightempclimstatementb = totalnumbclimstatementb.toString().substring(4,7)
                                    hightempclimstatementb = hightempclimstatementb.replace(/\,/g,"")
                                    //console.log(hightempclimstatementb) //current

                                    var lowtempclimstatementb = totalnumbclimstatementb.toString().substring(8,11)
                                    lowtempclimstatementb = lowtempclimstatementb.replace(/\,/g,"")
                                    //console.log(lowtempclimstatementb) //high

                                    var currenttempclimstatementb = totalnumbclimstatementb.toString().substring(0,3)
                                    currenttempclimstatementb = currenttempclimstatementb.replace(/\,/g,"")
                                    //console.log(currenttempclimstatementb) //low

                                    loadwin.currentweatherparam = currenttempclimstatementb
                                    loadwin.highweatherparam = hightempclimstatementb
                                    loadwin.lowweatherparam = lowtempclimstatementb
                                    weatherloader.visible = true;
                                    qboxoutput.visible = false;

                    if (currenttempclimstatementa <= "60") {
                        loadwin.weatherbackgroundimage = "images/snow.gif"
                    }

                    else if (currenttempclimstatementa <= "60" && qboxoutput.text.indexOf("mist") != -1 || qboxoutput.text.indexOf("light") != -1 && qboxoutput.text.indexOf("intensity") != -1 && qboxoutput.text.indexOf("drizzle") != -1) {
                            loadwin.weatherbackgroundimage = "images/rain.gif"
                    }

                    else if (currenttempclimstatementa >= "61") {
                        loadwin.weatherbackgroundimage = "images/clearsky.gif"
                    }

                    else if (currenttempclimstatementa >= "61" && qboxoutput.text.indexOf("mist") != -1 || qboxoutput.text.indexOf("light") != -1 && qboxoutput.text.indexOf("intensity") != -1 && qboxoutput.text.indexOf("drizzle") != -1) {
                            loadwin.weatherbackgroundimage = "images/rain.gif"
                    }


                }

                else if (qboxoutput.text.indexOf("Right") != -1 && qboxoutput.text.indexOf("now") != -1 && qboxoutput.text.indexOf("and") != -1 && qboxoutput.text.indexOf("degrees") != -1 && qboxoutput.text.indexOf("for") != -1 && qboxoutput.text.indexOf("a") != -1 && qboxoutput.text.indexOf("high") != -1 && qboxoutput.text.indexOf("low") != -1) {

                                    var totalnumbclimstatementc = qboxoutput.text.match(/\d/g)

                                    var hightempclimstatementc = totalnumbclimstatementc.toString().substring(4,7)
                                    hightempclimstatementc = hightempclimstatementc.replace(/\,/g,"")
                                    //console.log(hightempclimstatementc) //low

                                    var lowtempclimstatementc = totalnumbclimstatementc.toString().substring(8,11)
                                    lowtempclimstatementc = lowtempclimstatementc.replace(/\,/g,"")
                                    //console.log(lowtempclimstatementc) //current

                                    var currenttempclimstatementc = totalnumbclimstatementc.toString().substring(0,3)
                                    currenttempclimstatementc = currenttempclimstatementc.replace(/\,/g,"")
                                    //console.log(currenttempclimstatementc) //high

                                    loadwin.currentweatherparam = currenttempclimstatementc
                                    loadwin.highweatherparam = hightempclimstatementc
                                    loadwin.lowweatherparam = lowtempclimstatementc
                                    weatherloader.visible = true;
                                    qboxoutput.visible = false;

                    if (currenttempclimstatementa <= "60") {
                        loadwin.weatherbackgroundimage = "images/snow.gif"
                    }

                    else if (currenttempclimstatementa <= "60" && qboxoutput.text.indexOf("mist") != -1 || qboxoutput.text.indexOf("light") != -1 && qboxoutput.text.indexOf("intensity") != -1 && qboxoutput.text.indexOf("drizzle") != -1) {
                            loadwin.weatherbackgroundimage = "images/rain.gif"
                    }

                    else if (currenttempclimstatementa >= "61") {
                        loadwin.weatherbackgroundimage = "images/clearsky.gif"
                    }

                    else if (currenttempclimstatementa >= "61" && qboxoutput.text.indexOf("mist") != -1 || qboxoutput.text.indexOf("light") != -1 && qboxoutput.text.indexOf("intensity") != -1 && qboxoutput.text.indexOf("drizzle") != -1) {
                            loadwin.weatherbackgroundimage = "images/rain.gif"
                    }

                }

                else if (qboxoutput.text.indexOf("Tomorrow,") != -1 && qboxoutput.text.indexOf("will") != -1 && qboxoutput.text.indexOf("have") != -1 && qboxoutput.text.indexOf("a") != -1 && qboxoutput.text.indexOf("high") != -1 && qboxoutput.text.indexOf("low") != -1 && qboxoutput.text.indexOf("of") != -1) {

                                    var totalnumbclimstatementd = qboxoutput.text.match(/\d/g)

                                    var hightempclimstatementd = totalnumbclimstatementd.toString().substring(0, 3)
                                    hightempclimstatementd = hightempclimstatementd.replace(/\,/g,"")
                                    //console.log(hightempclimstatementd)

                                    var lowtempclimstatementd = totalnumbclimstatementd.toString().substring(4,7)
                                    lowtempclimstatementd = lowtempclimstatementd.replace(/\,/g,"")
                                    //console.log(lowtempclimstatementd)

                                    var currenttempclimstatementd = totalnumbclimstatementd.toString().substring(8,11)
                                    currenttempclimstatementd = currenttempclimstatementd.replace(/\,/g,"")
                                    //console.log(currenttempclimstatementd)

                                    loadwin.currentweatherparam = currenttempclimstatementd
                                    loadwin.highweatherparam = hightempclimstatementd
                                    loadwin.lowweatherparam = lowtempclimstatementd
                                    loadwin.forcasttext = "Forecast"
                                    loadwin.forcastdegree = " "
                                    weatherloader.visible = true;
                                    qboxoutput.visible = false;
                }


                else if (qboxoutput.text.indexOf("Tomorrow,") != -1 && qboxoutput.text.indexOf("it") != -1 && qboxoutput.text.indexOf("will") != -1 && qboxoutput.text.indexOf("be") != -1 && qboxoutput.text.indexOf("a") != -1 && qboxoutput.text.indexOf("high") != -1 && qboxoutput.text.indexOf("low") != -1 && qboxoutput.text.indexOf("of") != -1) {

                                    var totalnumbclimstatemente = qboxoutput.text.match(/\d/g)

                                    var hightempclimstatemente = totalnumbclimstatemente.toString().substring(0, 3)
                                    hightempclimstatemente = hightempclimstatemente.replace(/\,/g,"")
                                    //console.log(hightempclimstatemente)

                                    var lowtempclimstatemente = totalnumbclimstatemente.toString().substring(4,7)
                                    lowtempclimstatemente = lowtempclimstatemente.replace(/\,/g,"")
                                    //console.log(lowtempclimstatemente)

                                    var currenttempclimstatemente = totalnumbclimstatemente.toString().substring(8,11)
                                    currenttempclimstatemente = currenttempclimstatemente.replace(/\,/g,"")
                                    //console.log(currenttempclimstatemente)

                                    loadwin.currentweatherparam = currenttempclimstatemente
                                    loadwin.highweatherparam = hightempclimstatemente
                                    loadwin.lowweatherparam = lowtempclimstatemente
                                    loadwin.forcasttext = "Forecast"
                                    loadwin.forcastdegree = " "
                                    weatherloader.visible = true;
                                    qboxoutput.visible = false;
                }

                else
                                {
                                    qboxoutput.visible = true;
                                    weatherloader.visible = false;
                                }

                if (qboxoutput.text.indexOf("With") != -1 && qboxoutput.text.indexOf("ticker") != -1 && qboxoutput.text.indexOf("symbol") != -1 && qboxoutput.text.indexOf("dollar") != -1 && qboxoutput.text.indexOf("share") != -1) {

                var totalnumbstockpricestatementa = qboxoutput.text.match(/\d/g)
                    totalnumbstockpricestatementa = totalnumbstockpricestatementa.toString().replace(/\,/g,"")
                    var restrtotalnumbstockpricestatement = totalnumbstockpricestatementa.toString().toString().substring(0,totalnumbstockpricestatementa.length-2)+"."+totalnumbstockpricestatementa.substring(totalnumbstockpricestatementa.length-2);
                    var ressymbolname = qboxoutput.text.match(/symbol ([A-Z]+)/)[1];


                    //console.log(ressymbolname)
                    loadstock.currentstockprice = "$"+restrtotalnumbstockpricestatement
                    loadstock.currentstocksymbol = ressymbolname
                    qboxoutput.visible = false;
                    stockwidgetloader.visible = true
                }

                else if (qboxoutput.text.indexOf("with") != -1 && qboxoutput.text.indexOf("ticker") != -1 && qboxoutput.text.indexOf("symbol") != -1 && qboxoutput.text.indexOf("dollar") != -1 && qboxoutput.text.indexOf("share") != -1 && qboxoutput.text.indexOf("trading") != -1) {

                                    var totalnumbstockpricestatementb = qboxoutput.text.match(/\d/g)
                                    totalnumbstockpricestatementb = totalnumbstockpricestatementb.toString().replace(/\,/g,"")
                                    var restrtotalnumbstockpricestatementb = totalnumbstockpricestatementb.toString().toString().substring(0,totalnumbstockpricestatementb.length-2)+"."+totalnumbstockpricestatementb.substring(totalnumbstockpricestatementb.length-2);
                                    var ressymbolnameb = qboxoutput.text.match(/symbol ([A-Z]+)/)[1];

                                    //console.log(ressymbolnameb)
                                    loadstock.currentstockprice = "$"+restrtotalnumbstockpricestatementb
                                    loadstock.currentstocksymbol = ressymbolnameb

                                stockwidgetloader.visible = true
                                qboxoutput.visible = false;
                }
             
                else {
                qboxoutput.visible = true
                stockwidgetloader.visible = false
                }


            }
            anim1.running = true
        }

        onStatusChanged: if (socket.status == WebSocket.Error) {
                                 connectws.text = "Error"
                                 connectws.color = "red"
                          } else if (socket.status == WebSocket.Open) {
                                 connectws.text = "Ready"
                                 connectws.color = "green"
                          } else if (socket.status == WebSocket.Closed) {
                                 connectws.text = "Closed"
                                 connectws.color = "white"
                          } else if (socket.status == WebSocket.Connecting) {
                                 connectws.text = "Starting.."
                                 connectws.color = "white"
                          } else if (socket.status == WebSocket.Closing) {
                                 connectws.text = "Shutting.."
                                 connectws.color = "blue"
                          }


        active: false
    }

    ListModel {
        id:resultmodel
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

       Loader {
           id: welcomewidgetloader
           anchors.top: rectangletopbar.bottom
           anchors.bottom: rectanglebottombar.top
           anchors.left: parent.left
           anchors.right: parent.right
           visible: true;
           active: true;
           focus: true;
           source: "Welcome.qml"

           MouseArea {
               anchors.fill: parent

               onDoubleClicked: {
               welcomewidgetloader.visible = false;
               rectangleresultbox.visible = false;
               suggestionswidgetloader.visible = true;
               }
           }
       }

       Loader {
           id: suggestionswidgetloader
           anchors.top: rectangletopbar.bottom
           anchors.left: parent.left
           anchors.right: parent.right
           visible: false;
           source: "Suggestions.qml"
           active: true;
            focus: true;

            Connections {
               target: suggestionswidgetloader.item
               //Component.onCompleted: print ("Connections Component.onCompleted")
               onMessage: {
                 //console.log(msg);
                 var socketmessage = {};
                 socketmessage.type = "recognizer_loop:utterance";
                 socketmessage.data = {};
                 socketmessage.data.utterances = [msg];
                 socket.sendTextMessage(JSON.stringify(socketmessage));
                 anim1.running = true
                 suggestionswidgetloader.visible = false;
                 rectangleresultbox.visible = true;
               }
            }

            MouseArea {
                anchors.fill: parent

                onDoubleClicked: {
                suggestionswidgetloader.visible = false;
                rectangleresultbox.visible = true;
                }
            }

       }

     Options {
           id: settingswidgetloader
           anchors.top: rectangletopbar.bottom
           anchors.bottom: rectanglebottombar.top
           anchors.left: parent.left
           anchors.right: parent.right
           visible: false
         }


     Rectangle {
        id: rectangleresultbox
        x: 0
        y: 38
        width: 450
        height: 170
        color: "#1d1d1d"
        border.color: "#80000000"
        border.width: 0
        visible: false

        MouseArea {
            anchors.fill: parent

            onDoubleClicked: {
            suggestionswidgetloader.visible = true;
            rectangleresultbox.visible = false;
            }
        }

        Rectangle {
            id: weatherloader
            anchors.fill: parent
            visible: false;
        }

        Rectangle {
            id: stockwidgetloader
            anchors.fill: parent
            visible: false;
        }

        Image {
            id: image1
            x: 156
            y: 35
            opacity: 0.1
            width: 138
            height: 100
            source: "images/background.png"

            SequentialAnimation {
                        id: anim1
                        PropertyAnimation {
                            target: image1
                            property: "opacity"
                            to: "0.6"
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


        Text {
            id: qboxinput
            x: 0
            y: 18
            width: 450
            height: 60
            color: "#ffffff"
            text: qsTr(" ")
            textFormat: Text.PlainText
            elide: Text.ElideMiddle
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            font.pixelSize: 12
            wrapMode: Text.WordWrap
        }

        Text {
            id: qboxoutput
            x: 0
            y: 50
            width: 450
            height:60
            color: "#ffffff"
            wrapMode: Text.WordWrap
            elide: Text.ElideMiddle
            text: qsTr(" ")
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }

        Button {
            id: regisbutton
            text:"Visit Mycroft@Home"
            visible: false;
            anchors.top: qboxoutput.bottom
            anchors.topMargin: -50
            anchors.horizontalCenter: rectangleresultbox.horizontalCenter
            onClicked: Qt.openUrlExternally("http://home.mycroft.ai");
        }
 }

    Rectangle {
        id: rectanglebottombar
        x: 0
        y: 214
        width: 450
        height: 36
        color: "#1b1b1b"
        radius: 0
        border.color: "#80000000"
        border.width: 0

        TextField {
            id: qinput
            x: 1
            y: 4
            width: 323
            height: 27
            placeholderText: qsTr("Enter Query or Say 'Hey Mycroft'")
            onAccepted: {
                rectangleresultbox.visible = true;
                suggestionswidgetloader.visible = false;
                var socketmessage = {};
                socketmessage.type = "recognizer_loop:utterance";
                socketmessage.data = {};
                socketmessage.data.utterances = [qinput.text];
                socket.sendTextMessage(JSON.stringify(socketmessage));
                //qinput.text =
                anim1.running = true
            }
        }

        Button {
            id: qinputbutton
            x: 322
            y: 1
            width: 128
            height: 33
            text: qsTr("                        ")
            activeFocusOnPress: false
            iconSource: "images/appicon.png"

            style: ButtonStyle {
                background: Rectangle {
                    color: "#0b0b0b";

                }
            }

            MouseArea {
                id: mouseArea3
                x: 0
                y: 0
                width: 128
                height: 33
                hoverEnabled: false
                onClicked: {
                    rectangleresultbox.visible = true;
                    suggestionswidgetloader.visible = false;
                    var socketmessage = {};
                    socketmessage.type = "recognizer_loop:utterance";
                    socketmessage.data = {};
                    socketmessage.data.utterances = [qinput.text];
                    socket.sendTextMessage(JSON.stringify(socketmessage));
                    //qinput.text = ""
                    anim1.running = true
                }

                Text {
                    id: text1
                    x: 37
                    y: 9
                    width: 75
                    height: 12
                    color: "#ffffff"
                    text: qsTr("  Enter Query")
                    font.pixelSize: 12
                }
            }
        }
    }

    Rectangle {
        id: rectangletopbar
        x: 0
        y: 0
        width: 450
        height: 37
        color: "#1d1d1d"
        border.width: 0
        border.color: "#80000000"

        Button {
            id: startmycservice
            x: 0
            y: 0
            width: 154
            height: 36
            text: qsTr("")

            style: ButtonStyle {
                background: Rectangle {
                    color: "#0b0b0b";

                }
            }


          //  Settings {
            //    id: getstngs
              //  visible: false
            //}

            MouseArea {
                id: mouseArea1
                x: 0
                y: 0
                width: 149
                height: 36
                hoverEnabled: false

                onClicked: {
                                    var strt = settingswidgetloader.strscript + " " + "start"
                                    myLauncher.launchScript(strt)
                                    welcomewidgetloader.active = false;
                                    suggestionswidgetloader.visible = true;
                                    //connectws.text = qsTr("Starting...");
                                    anim1.running = true
                                    delay(12000, function() {
                                        socket.active = true
                                        //connectws.text = qsTr("Connected")
                                        anim1.running = true
                                    })
                }

                                Text {
                                    id: text2
                                    x: 8
                                    y: 11
                                    width: 133
                                    height: 17
                                    color: "#ffffff"
                                    text: qsTr("Start Mycroft Service")
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 12
                                }

            }
        }

        Button {
            id: stopmycservice
            x: 155
            y: 0
            width: 148
            height: 36
            text: qsTr(" ")

            style: ButtonStyle {
                background: Rectangle {
                    color: "#0b0b0b";

                }
            }

            MouseArea {
                id: mouseArea2
                x: 0
                y: 0
                width: 143
                height: 36
                hoverEnabled: false

                onClicked: {
                    var stpsc = settingswidgetloader.stpscript + " " + "stop"
                    //console.log(stpsc)
                    myLauncher.launchScript(stpsc)
                    welcomewidgetloader.active = true;
                    suggestionswidgetloader.visible = false;
                    rectangleresultbox.visible = false;
                    //connectws.text = qsTr("Stopped");
                    socket.active = false
                    anim1.running = true
                }

                Text {
                    id: text3
                    x: 12
                    y: 11
                    width: 122
                    height: 15
                    color: "#ffffff"
                    text: qsTr("Stop Mycroft Service")
                    font.pixelSize: 12
                }
            }
        }

        Text {
            id: connectws
            x: 304
            y: 0
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: stopmycservice.right
            anchors.leftMargin: 10
            color: "#ffffff"
            width: 86
            height: 36
            text: qsTr("Not Started")
            }

        Button {
           id: apsettings
           width: 50
           height: 36
           anchors.left: connectws.right
           iconSource: "images/settings-icon.png"
           iconName: "settings-icon.png"

           onClicked: {
                if (settingswidgetloader.visible === false) {
                    welcomewidgetloader.active = false
                    suggestionswidgetloader.active = false
                    rectangleresultbox.visible = false
                    settingswidgetloader.visible = true
                }
                else if (settingswidgetloader.visible === true)
                {
                    settingswidgetloader.visible = false
                    suggestionswidgetloader.active = true
                    rectangleresultbox.visible = true
                }
           }

        }
        }
 }

