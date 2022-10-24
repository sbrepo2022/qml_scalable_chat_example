import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12

Window {
    id: mainWindow
    visible: true
    width: 360
    height: 640
    title: qsTr("GSChat")
    color: "#f0f8f0" // light theme
    //color: "#181818" // dark theme

    function mp(x) {
        return x * Screen.pixelDensity;
    }

    GSChatStyle { // default light theme
        id: gsWidgetStyleLight
        scale: 0.7
    }

    GSChatStyle { // custom dark theme
        id: gsWidgetStyleDark
        scale: 0.7

        msgColor1: "#555"
        msgColor2: "#333"
        msgTextColor1: "#ddd"
        msgTextColor2: "#ddd"

        msgEditColor: "#555"

        mainTextColor: "#ddd"
        secondTextColor: "#aaa"
        thirdTextColor: "#ddd"

        shadowColor1: "#080808"
        shadowColor2: "#080808"

        sendButtonImagePath: "textures/round-send-24px-dark_theme.svg"
    }

    GSChatWidget {
        id: chatWidget
        anchors.fill: parent
        gsStyle: gsWidgetStyleLight
    }

    Drawer {
        id: drawer
        width: 0.66 * mainWindow.width;
        height: parent.height
        dragMargin: mp(4)

        Column {
            anchors.fill: parent
            Switch {
                text: "Темная тема"
                onCheckedChanged: {
                    if (checked) {
                        mainWindow.color = "#181818";
                        chatWidget.gsStyle = gsWidgetStyleDark;
                    }
                    else {
                        mainWindow.color = "#f0f8f0";
                        chatWidget.gsStyle = gsWidgetStyleLight;
                    }
                }
            }
            Row {
                width: drawer.width
                Slider {
                    width: 0.7 * drawer.width
                    from: 0.5
                    to: 2.0
                    stepSize: 0.1
                    value: 0.7
                    onValueChanged: {
                        gsWidgetStyleLight.scale = value;
                        gsWidgetStyleDark.scale = value;
                    }
                }
                Text {
                    text: "scale"
                }
            }
        }
    }
}
