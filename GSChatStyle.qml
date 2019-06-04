import QtQuick 2.0
import QtQuick.Window 2.11

Item {
    function mp(x) {
        return x * Screen.pixelDensity;
    }

    property double padding: mp(4)
    property double radius: mp(4)
    property color color1: "green"
    property color color2: "red"
    property color color3: "blue"
    property color textColor1: "black"
    property color textColor2: "white"
}
