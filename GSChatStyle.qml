import QtQuick 2.0
import QtQuick.Window 2.12

Item {
    function mp(x) {
        return x * Screen.pixelDensity;
    }

    FontLoader {source: "fonts/Montserrat-Regular.ttf"}

    property double scale: 1.0                  // gui scale
    property double sizeScale: scale            // gui sizes scale
    property double fontScale: scale            // font scale

    property double padding: mp(4) * sizeScale  // application padding
    property double radius: mp(4) * sizeScale   // application rect radius

    property color msgColor1: "#ffffff"         // other user's messages rect color
    property color msgColor2: "#008000"         // user's messages rect color
    property color msgTextColor1: "#000"        // other user's messages text color
    property color msgTextColor2: "#fff"        // user's messages text color

    property color msgEditColor: "#fff"         // msg edit background color

    property color mainTextColor: "#000"        // text color
    property color secondTextColor: "#30a030"   // text subcolor 1
    property color thirdTextColor: "#80d080"    // text subcolor 2

    property int h1FontSize: mp(4) * fontScale
    property int h2FontSize: mp(4) * fontScale
    property int fontSize: mp(4) * fontScale
    property string fontFamily: "Montserrat"

    property double shadowSize1: mp(6) * sizeScale
    property double shadowSize2: mp(3) * sizeScale
    property double shadowOffset1: mp(1.2) * sizeScale
    property double shadowOffset2: mp(0.6) * sizeScale
    property string shadowColor1: "#aaa"
    property string shadowColor2: "#aaa"

    property string sendButtonImagePath: "textures/round-send-24px.svg"

    property string msgHeaderPath: "GSChatMessageHeader.qml"
    property string msgEditPath: "GSChatMessageEdit.qml"
}
