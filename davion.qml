// Davion Theme for Quickshell
// Defines the color palette for the House Davion LCARS interface

import QtQuick

QtObject {
    id: davionTheme

    // Primary colors
    property color background: "#10151d"    // Deep black/navy
    property color panel: "#202a36"         // Lighter panel
    property color red: "#a51f2b"           // Federated Suns red
    property color gold: "#d9a52e"          // Gold command accents
    property color blue: "#234b78"          // Blue tactical displays
    property color cream: "#e9dfc5"         // Cream/off-white text
    property color amber: "#f2a65a"         // Amber for highlights

    // Derived colors for states
    property color online: "#8fd6a3"        // Green for online status
    property color warning: "#ffb86c"       // Amber/orange for warnings
    property color error: "#ff5555"         // Red for errors
}