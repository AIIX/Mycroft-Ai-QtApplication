import QtQuick 2.0

Item {
anchors.fill: parent
property alias currentstockprice: stockWidgetPrice.text
property alias currentstocksymbol: stockWidgetSymbol.text

        Image {
            id: stockWidgetBackground
            anchors.fill: parent
            source: "images/stocks.png"

            Text {
                id: stockWidgetHeader
                color: "#ffffff"
                text: qsTr("Stock Price Info")
                style: Text.Raised
                font.italic: false
                textFormat: Text.AutoText
                anchors.top: parent.top
                anchors.topMargin: 30
                wrapMode: Text.NoWrap
                font.bold: true
                font.family: "Times New Roman"
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.pixelSize: 30
            }

            Text {
                id: stockWidgetSymbol
                color: "#ffffff"
                text: qsTr("Text")
                font.bold: true
                anchors.top: stockWidgetHeader.bottom
                anchors.topMargin: 15
                anchors.right: parent.right
                style: Text.Raised
                font.family: "Times New Roman"
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 40
                font.pixelSize: 35

                Text {
                    id: stockWidgetPriceLabel
                    color: "#ffffff"
                    text: qsTr("Stock Price:")
                    font.italic: true
                    font.family: "Times New Roman"
                    style: Text.Raised
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 150
                    font.pixelSize: 24

                    Text {
                        id: stockWidgetPrice
                        color: "#ffffff"
                        text: qsTr("128.89")
                        font.italic: true
                        style: Text.Raised
                        font.family: "Times New Roman"
                        font.bold: true
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 124
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        font.pixelSize: 27
                    }
                }
            }
        }
}


