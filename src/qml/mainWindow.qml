import QtQuick 2.4
import QtCanvas3D 1.1

import QtGraphicalEffects 1.0
import QtLocation 5.9
import QtPositioning 5.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0

import "qrc:/qml"

ApplicationWindow
{
    title: qsTr("Smooth Rider")
    visible: true
    width: 1280
    height: 720
    //visibility: ApplicationWindow.FullScreen

    Item
    {
        anchors.fill: parent
        MapWindow {
            z: 0
        }        
    }
}
