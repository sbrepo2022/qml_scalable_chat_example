import QtQuick 2.0

Item {
    property GSChatStyle gsStyle: GSChatStyle {}

    id: topItem
    property string message
    property string time
    property int maxWidth
    property bool msgAlign
    height: childrenRect.height

    FastShadow {
        anchors.fill: msgSurface
        radius: topItem.gsStyle.shadowSize2
        borderRadius: msgSurface.radius
        verticalOffset: topItem.gsStyle.shadowOffset2
        color: topItem.gsStyle.shadowColor2
    }

    Rectangle {
        id: msgSurface
        color: topItem.msgAlign ? topItem.gsStyle.msgColor1 : topItem.gsStyle.msgColor2
        radius: topItem.gsStyle.radius
        anchors.left: topItem.msgAlign ? parent.left : undefined
        anchors.right: topItem.msgAlign ? undefined : parent.right
        width: msgText.contentWidth + 2 * topItem.gsStyle.padding
        height: msgText.contentHeight + 2 * topItem.gsStyle.padding
        Text {
            id: msgText
            x: topItem.gsStyle.padding
            y: topItem.gsStyle.padding
            width: topItem.maxWidth - 3 * topItem.gsStyle.padding - timeText.width
            text: topItem.message
            font.pixelSize: topItem.gsStyle.fontSize
            font.family: topItem.gsStyle.fontFamily
            color: topItem.msgAlign ? topItem.gsStyle.msgTextColor1 : topItem.gsStyle.msgTextColor2
            linkColor: topItem.msgAlign ? topItem.gsStyle.msgTextColor1 : topItem.gsStyle.msgTextColor2
            wrapMode: Text.Wrap

            onLinkActivated: {
                Qt.openUrlExternally(link)
            }
        }
    }
    Text {
        id: timeText
        text: topItem.time
        font.pixelSize: topItem.gsStyle.fontSize
        font.family: topItem.gsStyle.fontFamily
        color: topItem.gsStyle.thirdTextColor
        anchors.left: topItem.msgAlign ? msgSurface.right : undefined
        anchors.leftMargin: topItem.msgAlign ? topItem.gsStyle.padding : 0
        anchors.right: topItem.msgAlign ? undefined : msgSurface.left
        anchors.rightMargin: topItem.msgAlign ? 0 : topItem.gsStyle.padding
        anchors.top: msgSurface.top
        anchors.topMargin: topItem.gsStyle.padding
    }
}
