import QtQuick 2.0

Item {
    GSChatStyle {
        id: gsStyle
    }

    id: topItem
    property string message
    property string time
    property int maxWidth
    property int msgAlign
    height: childrenRect.height
    Rectangle {
        id: msgSurface
        color: topItem.msgAlign ? gsStyle.msgColor1 : gsStyle.msgColor2
        radius: gsStyle.radius
        anchors.left: topItem.msgAlign ? parent.left : undefined
        anchors.right: topItem.msgAlign ? undefined : parent.right
        y: gsStyle.padding
        width: msgText.contentWidth + 2 * gsStyle.padding
        height: msgText.contentHeight + 2 * gsStyle.padding
        Text {
            id: msgText
            x: gsStyle.padding
            y: gsStyle.padding
            width: topItem.maxWidth - 3 * gsStyle.padding - timeText.width
            text: topItem.message
            color: topItem.msgAlign ? gsStyle.msgTextColor1 : gsStyle.msgTextColor2;
            wrapMode: Text.Wrap
        }
    }
    Text {
        id: timeText
        text: topItem.time
        anchors.left: topItem.msgAlign ? msgSurface.right : undefined
        anchors.leftMargin: topItem.msgAlign ? gsStyle.padding : 0
        anchors.right: topItem.msgAlign ? undefined : msgSurface.left
        anchors.rightMargin: topItem.msgAlign ? 0 : gsStyle.padding
        anchors.top: msgSurface.top
        anchors.topMargin: gsStyle.padding
    }
}
