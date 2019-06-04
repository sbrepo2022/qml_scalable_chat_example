import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4

Item {
    GSChatStyle {
        id: gsStyle
    }

    id: topItem

    ListModel {
        id: msgModel
        ListElement {
            l_style: 1
            l_sender: "GEOSAS inc."
            l_message: "Welcome to GEOSAS chat!"
            l_time: "16:18"
        }
        ListElement {
            l_style: 0
            l_sender: "Sergey"
            l_message: "Hello world!"
            l_time: "16:18"
        }
        ListElement {
            l_style: 1
            l_sender: "GEOSAS inc."
            l_message: "Welcome to GEOSAS chat! There is some text"
            l_time: "16:18"
        }
        ListElement {
            l_style: 0
            l_sender: "Sergey"
            l_message: "Sample"
            l_time: "16:18"
        }
    }
    ScrollView {
        anchors.fill: parent
        ListView {
            id: msgView
            model: msgModel
            delegate: GSChatMsgDelegate {
                style: l_style
                sender: l_sender
                message: l_message
                time: l_time
                width: parent.width
            }

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: gsStyle.padding
            spacing: gsStyle.padding * 2
        }
    }
}
