CONFIG += c++14

QT += qml network quick positioning location sql widgets

DEFINES += QT_DEPRECATED_WARNINGS
ios|android {
    QT -= widgets
}

QML_IMPORT_PATH=./qml

########
#
SOURCES += \
		main.cpp

#
#

RESOURCES += rider-resources.qrc
#
########
