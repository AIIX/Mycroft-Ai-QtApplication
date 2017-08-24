import QtQuick 2.7
import QtQuick.Templates 2.0 as T

T.Switch {
    id: control

    implicitWidth: indicator.implicitWidth
    implicitHeight: switchHandle.implicitHeight
    
    property alias circolour: rectangle.color

    indicator: Rectangle {
        id: switchHandle
        implicitWidth: 6 * 4.8
        implicitHeight: 6 * 2.6
        x: control.leftPadding
        anchors.verticalCenter: parent.verticalCenter
        radius: 6 * 1.3
        color: Qt.darker("#222", 1.2)
        border.color: "#fff"

        Rectangle {
            id: rectangle

            width: 6 * 2.6
            height: 6 * 2.6
            radius: 10 * 1.3
            color: Qt.lighter("#222", 1.5)
            border.color: "#fff"
        }

        states: [
            State {
                name: "off"
                when: !control.checked && !control.down
            },
            State {
                name: "on"
                when: control.checked && !control.down

                PropertyChanges {
                    target: switchHandle
                    color: Qt.lighter("#222", 1.5)
                    border.color: "#fff"
                }

                PropertyChanges {
                    target: rectangle
                    x: parent.width - width

                }
            },
            State {
                name: "off_down"
                when: !control.checked && control.down

                PropertyChanges {
                    target: rectangle
                    color: "#fff"
                }

            },
            State {
                name: "on_down"
                extend: "off_down"
                when: control.checked && control.down

                PropertyChanges {
                    target: rectangle
                    x: parent.width - width
                    color: "#fff"
                }

                PropertyChanges {
                    target: switchHandle
                    color: "#222"
                    border.color: "#222"
                }
            }
        ]
    }
}
