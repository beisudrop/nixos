import QtQuick

QtObject {
    // Theme colors from ~/.cache/hellwal/quickshell-colors.qml
    readonly property color background: "#%%color1%%"
    readonly property color text: "#%%color2%%"
    readonly property color textSecondary: "#%%color3%%"
    readonly property color border: "#%%color4%%"
    readonly property color accent: "#%%color5%%"
    readonly property color success: "#%%color6%%"
    readonly property color warning: "#%%color7%%"
    readonly property color error: "#%%color8%%"
} 

Loader {
    id: colorLoader
    source: "~/.cache/hellwal/quickshell-colors.qml"
    active: true
}

// Access colors via Loader.item
Rectangle {
    color: colorLoader.item ? colorLoader.item.background : "#0a0b10"
    Text {
        color: colorLoader.item ? colorLoader.item.text : "white"
    }
}   
