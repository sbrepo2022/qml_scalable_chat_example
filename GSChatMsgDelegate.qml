import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.12

Item {
    property GSChatStyle gsStyle: GSChatStyle {}

    id: topItem
    property bool msgAlign
    property bool hideSender
    property string sender
    property string message
    property string time
    height: childrenRect.height

    Column {
        width: parent.width
        spacing: topItem.gsStyle.padding / 2
        Text {
            text: topItem.sender
            font.pixelSize: topItem.gsStyle.h2FontSize
            font.family: topItem.gsStyle.fontFamily
            color: topItem.gsStyle.secondTextColor
            anchors.left: topItem.msgAlign ? parent.left : undefined
            anchors.leftMargin: topItem.msgAlign ? topItem.gsStyle.padding : 0
            anchors.right : topItem.msgAlign ? undefined : parent.right
            anchors.rightMargin: topItem.msgAlign ? 0 : topItem.gsStyle.padding
            visible: (! topItem.hideSender) && msgAlign
        }
        GSChatMessage {
            id: chatMsg
            gsStyle: topItem.gsStyle
            width: parent.width
            maxWidth: parent.width
            msgAlign: topItem.msgAlign
            message: topItem.message
            time: topItem.time
        }
    }
}
