import QtQuick 2.0

Item {
    GSChatStyle {
        id: gsStyle
    }

    id: topItem
    property string message
    property int maxWidth
    height: childrenRect.height
    Rectangle {
        color: gsStyle.color1
        radius: gsStyle.radius
        id: msgSurface
        //x: gsStyle.padding
        y: gsStyle.padding
        width: msgText.contentWidth + 2 * gsStyle.padding
        height: msgText.contentHeight + 2 * gsStyle.padding
        Text {
            id: msgText
            x: gsStyle.padding
            y: gsStyle.padding
            width: topItem.maxWidth - 4 * gsStyle.padding
            text: topItem.message
            color: gsStyle.textColor2;
            wrapMode: Text.Wrap
        }
    }
}
