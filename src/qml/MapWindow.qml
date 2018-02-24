import QtLocation 5.9
import QtPositioning 5.9
import QtQuick 2.4

Item {
    id: mapWindow
    anchors.fill: parent
    property bool isNight: true

    Text {
        id: turnInstructions
        text: "go right!"

        color: "red"
        font.family: "Lato"
        font.weight: Font.Light
        font.pixelSize: 24

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.Top

        z: 3
    }


    Plugin {
        id: mapPlugin
        name: "mapboxgl"

        PluginParameter {
            name: "mapboxgl.access_token"
            value: "pk.eyJ1IjoidG1wc2FudG9zIiwiYSI6ImNqMWVzZWthbDAwMGIyd3M3ZDR0aXl3cnkifQ.FNxMeWCZgmujeiHjl44G9Q"
        }

        PluginParameter {
            name: "mapboxgl.mapping.additional_style_urls"
            value: "mapbox://styles/mapbox/navigation-guidance-day-v2,mapbox://styles/mapbox/navigation-guidance-night-v2,mapbox://styles/mapbox/navigation-preview-day-v2,mapbox://styles/mapbox/navigation-preview-night-v2"
        }

    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(59.91, 10.75) // Oslo
        zoomLevel: 16
        tilt: 78
        copyrightsVisible: false

        activeMapType: {
            return mapWindow.isNight ? supportedMapTypes[1] : supportedMapTypes[0];
        }

        MapParameter {
            type: "layer"
            property var name: "3d-buildings"
            property var source: "composite"
            property var sourceLayer: "building"
            property var layerType: "fill-extrusion"
            property var minzoom: 15.0
        }

        MapParameter {
            type: "filter"

            property var layer: "3d-buildings"
            property var filter: [ "==", "extrude", "true" ]
        }

        MapParameter {
            type: "paint"

            property var layer: "3d-buildings"
            property var fillExtrusionColor: "#00617f"
            property var fillExtrusionOpacity: .6
            property var fillExtrusionHeight: { return { type: "identity", property: "height" } }
            property var fillExtrusionBase: { return { type: "identity", property: "min_height" } }
        }

    }
}
