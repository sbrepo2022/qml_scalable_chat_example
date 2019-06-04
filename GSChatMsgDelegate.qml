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
            x: gsStyle.padding
        }
        Item {
            id: contentItem
            width: parent.width
            height: childrenRect.height

            GSChatMessage {
                id: chatMsg
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.right: timeItem.left
                maxWidth: contentItem.width - timeItem.width
                message: topItem.message
            }
            Item {
                id: timeItem
                anchors.top: parent.top
                anchors.right: parent.right
                height: timeText.height
                width: timeText.width

                Text {
                    id: timeText
                    text: topItem.time
                }
            }
        }
    }
}
