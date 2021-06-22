import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import "../Constants"

ColorOverlay {
    Behavior on color { ColorAnimation { duration: Style.animationDuration } }
}
