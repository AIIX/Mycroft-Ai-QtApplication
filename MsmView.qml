import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.1

Rectangle {
                id: skillcontent
                width: cbwidth
                anchors { left: parent.left; right: parent.right }
                height: 60
                border.width: 0
                border.color: "lightsteelblue"
                radius: 2
                color: "#222"

//                function getSkillInfoLocal() {
//                var customFold = '/opt/mycroft/skills/'
//                var skillPath = customFold + model.name +'/__init__.py'
//                if(myReader.file_exists_local(skillPath)){
//                    msminstllbtn.visible = false
//                    instlabel.color = "Green"
//                    instlabel.text = "Installed"
//                    }
//                else {
//                    //console.log(skillPath)
//                    instlabel.text = "Not Installed"
//                    }
//                }

                function exec(msmparam) {
                    var bscrpt = innerset.msmloc
                    return launchinstaller.msmapp("x-terminal-emulator --hold -e" + " " + bscrpt + " install " + model.url)
                }

                Component.onCompleted: {
                    //getSkillInfoLocal()
                    //msmSkillInstallProgBar.visible = false;
                }

                Column {
                id: skillcolumn
                width: parent.width / 80

                Label {
                font.capitalization: Font.AllUppercase
                wrapMode: Text.WordWrap
                text: model.name
                }

                Label {
                font.pointSize: 8
                wrapMode: Text.WordWrap
                text: model.url
                 }
                }

//                Label {
//                id: instlabel
//                font.pointSize: 8
//                wrapMode: Text.WordWrap
//                anchors.right: msminstllbtn.left
//                anchors.rightMargin: 5
//                text: ""
//                }

                Button {
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                id: msminstllbtn
                visible: true
                text: "\u25BC Install"
                flat: true
                checked: false
                focus: false
                width: 120
                height: 42
                Material.background: Material.Grey
                Material.foreground: Material.BlueGrey

                onClicked: {
                    console.log(model.url)
                    var msmprogress = exec()
//                    var getcurrentprogress = msmprogress.split("\n")
//                    console.log(getcurrentprogress);
//                    if(getcurrentprogress.indexOf("Cloning repository") != -1)
//                        {
//                         msmSkillInstallProgBar.visible = true;
//                         msmSkillInstallProgBar.indeterminate = true;
//                        }
//                    if(getcurrentprogress.indexOf("Skill installed!") != -1)
//                        {
//                        msmSkillInstallProgBar.indeterminate = false;
//                        msmSkillInstallProgBar.value = 100;
//                        instlabel.color = "Green"
//                        instlabel.text = "Installed"
//                        }
                    }

                }

//                ProgressBar {
//                    anchors.right: parent.right
//                    anchors.rightMargin: 2
//                    anchors.bottom: parent.bottom
//                    width: 40
//                    id: msmSkillInstallProgBar
//                    visible: false
//                    indeterminate: false
//                }

                }
