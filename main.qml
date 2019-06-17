import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.12

Window {
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
    }

    GSChatStyle { // custom dark theme
        id: gsWidgetStyleDark
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
        anchors.fill: parent
        gsStyle: gsWidgetStyleLight
    }
}
