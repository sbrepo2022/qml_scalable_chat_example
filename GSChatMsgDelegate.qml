import QtQuick 2.0

Item {
    GSChatStyle {
        id: gsStyle
    }

    id: topItem
    property int style
    property string sender
    property string message
    property string time
    height: childrenRect.height

    Column {
        width: parent.width
        Text {
            text: topItem.sender
            anchors.left: topItem.style ? parent.left : undefined
            anchors.leftMargin: topItem.style ? gsStyle.padding : 0
            anchors.right : topItem.style ? undefined : parent.right
            anchors.rightMargin: topItem.style ? 0 : gsStyle.padding
        }
        GSChatMessage {
            id: chatMsg
            width: parent.width
            maxWidth: parent.width
            message: topItem.message
            time: topItem.time
            msgAlign: topItem.style
        }
    }
}
