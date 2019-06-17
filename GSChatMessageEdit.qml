import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.12

Item {
    id: topItem
    signal sendMessage(string text)
    property alias text: msgEdit.text
    property GSChatStyle gsStyle: GSChatStyle {}

    height: msgEditItem.height + topItem.gsStyle.padding * 2
    Item {
        id: msgEditItem
        anchors.bottom: parent.bottom
        anchors.bottomMargin: topItem.gsStyle.padding
        anchors.left: parent.left
        anchors.leftMargin: topItem.gsStyle.padding
        anchors.right: parent.right
        anchors.rightMargin: topItem.gsStyle.padding
        height: msgEdit.contentHeight + topItem.gsStyle.padding * 2

        FastShadow {
            anchors.fill: msgSurface
            radius: topItem.gsStyle.shadowSize1
            borderRadius: msgSurface.radius
            verticalOffset: topItem.gsStyle.shadowOffset1
            color: topItem.gsStyle.shadowColor1
        }

        Rectangle {
            id: msgSurface
            anchors.fill: parent
            radius: height / 2
            color: topItem.gsStyle.msgEditColor

            TextField {
                id: msgEdit
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: topItem.gsStyle.padding
                anchors.right: sendButton.left
                anchors.rightMargin: topItem.gsStyle.padding
                clip: true
                selectByMouse: true
                font.pointSize: topItem.gsStyle.fontSize
                font.family: topItem.gsStyle.fontFamily
                color: topItem.gsStyle.mainTextColor
                placeholderText: "Напишите сообщение..."
                background: Rectangle {
                    anchors.fill: parent
                    color: "#00000000"
                }
            }

            Item {
                id: sendButton
                height: parent.height
                width: height
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                Image {
                    anchors.fill: parent
                    anchors.margins: topItem.gsStyle.padding / 2

                    source: topItem.gsStyle.sendButtonImagePath
                    sourceSize.width: width;
                    sourceSize.height: height;
                    smooth: true
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (msgEdit.text !== "" || msgEdit.preeditText !== "")
                            topItem.sendMessage(msgEdit.text + msgEdit.preeditText);
                        msgEdit.clear();
                    }
                }
            }
        }
    }
}
