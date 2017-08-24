TEMPLATE = app
CONFIG += c++11

QT += core qml quick widgets quickcontrols2
QT += webkit websockets xml

SOURCES += main.cpp \
    scriptlauncher.cpp \
    iconscriptlauncher.cpp \
    msmapp.cpp \
    filereader.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    scriptlauncher.h \
    iconscriptlauncher.h \
    msmapp.h \
    filereader.h

DISTFILES += \
    qtquickcontrols2.conf
