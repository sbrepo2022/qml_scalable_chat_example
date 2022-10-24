import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.12
import "GSChatFunctions.js" as GSCFunct

Item {
    property GSChatStyle gsStyle: GSChatStyle {}
    signal sendMessage(string text);

    id: topItem

    property int notSendMsg: 0
    function appendMsgToList(newMsg) {
        newMsg.l_message =  GSCFunct.replaceStringURI(newMsg.l_message);
        msgModel.append(newMsg);
    }

    function addNotSendedMessage(message) { // добавить сообщение в качестве неотправленных
        var currDate = new Date();
        var hours = currDate.getHours();
        var minutes = currDate.getMinutes();
        var resultTime = "";
        resultTime = resultTime + (hours < 10 ? "0" : "") + hours + ":" + (minutes < 10 ? "0" : "") + minutes;
        appendMsgToList({"l_msgAlign": false, "l_hideSender": true, "l_sender": "", "l_message": message, "l_time": resultTime}); // устанавливать текущее время
        notSendMsg += 1;
    }

    ListModel {
        id: msgModel
        ListElement {
            l_msgAlign: true
            l_hideSender: false
            l_sender: "GEOSAS inc."
            l_message: "Welcome to GEOSAS chat!"
            l_time: "16:18"
        }
        ListElement {
            l_msgAlign: false
            l_hideSender: false
            l_sender: "Sergey"
            l_message: "Hello world!"
            l_time: "16:18"
        }
        ListElement {
            l_msgAlign: true
            l_hideSender: false
            l_sender: "GEOSAS inc."
            l_message: "Welcome to GEOSAS chat! There is some long text? Yes, there is some long text!"
            l_time: "16:18"
        }
        ListElement {
            l_msgAlign: false
            l_hideSender: false
            l_sender: "Sergey"
            l_message: "Sample"
            l_time: "16:18"
        }
        ListElement {
            l_msgAlign: false
            l_hideSender: true
            l_sender: "Sergey"
            l_message: "Site Qt: <a href=\"http://qt-project.org\">Qt Project website</a>"
            l_time: "16:18"
        }
        ListElement {
            l_msgAlign: true
            l_hideSender: false
            l_sender: "Бизнес-тренер ИВАН"
            l_message: "Трейдинг доступен каждому!"
            l_time: "16:18"
        }
    }

    ScrollView {
        anchors.fill: parent
        ListView {
            id: msgView
            model: msgModel
            delegate: GSChatMsgDelegate {
                gsStyle: topItem.gsStyle
                msgAlign: l_msgAlign
                hideSender: l_hideSender
                sender: l_sender
                message: l_message
                time: l_time
                width: parent.width
            }

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: topItem.gsStyle.padding
            spacing: topItem.gsStyle.padding / 2
            displayMarginBeginning: topItem.gsStyle.padding
            displayMarginEnd: topItem.gsStyle.padding * 2

            header: Item {
                height: msgHeader.height
            }

            footer: Item {
                height: msgEdit.height
            }
        }
    }

    Loader {
        id: msgHeader
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        onStatusChanged: {
            if (status == Loader.Ready) {
                item.gsStyle = Qt.binding(function() {return topItem.gsStyle});
            }
        }
    }

    Loader {
        id: msgEdit
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        onStatusChanged: {
            if (status == Loader.Ready) {
                item.gsStyle = Qt.binding(function() {return topItem.gsStyle});
                item.sendMessage.connect(sendMessageRecieved);
            }
        }
    }

    Component.onCompleted: {
        msgHeader.source = topItem.gsStyle.msgHeaderPath;
        msgEdit.source = topItem.gsStyle.msgEditPath;
    }

    function sendMessageRecieved(text) { // вызвать сигнал отправки сообщения
        addNotSendedMessage(text);
        topItem.sendMessage(text);
    }
}
