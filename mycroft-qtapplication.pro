TEMPLATE = app
CONFIG += c++11

QT += core qml quick widgets

SOURCES += main.cpp \
    scriptlauncher.cpp \
    iconscriptlauncher.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    scriptlauncher.h \
    iconscriptlauncher.h
