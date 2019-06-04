import QtQuick 2.0
import QtQuick.Window 2.11

Item {
    function mp(x) {
        return x * Screen.pixelDensity;
    }

    property double padding: mp(4)
    property double radius: mp(4)
    property color msgColor1: "#ddd"
    property color msgColor2: "green"
    property color msgTextColor1: "black"
    property color msgTextColor2: "white"
}
