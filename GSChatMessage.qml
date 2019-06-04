import QtQuick 2.0

Item {
    id: topItem
    property string message
    property int maxWidth
    Rectangle {
        color: "red" // <----------
        id: msgSurface
        width: msgText.implicitWidth
        height: msgText.implicitHeight
        Text {
            id: msgText
            width: topItem.maxWidth // - padding
            text: topItem.message
            wrapMode: Text.Wrap
        }
    }
}
