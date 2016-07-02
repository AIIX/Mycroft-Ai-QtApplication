#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "ExampleAdaptor.h"
#include "scriptlauncher.h"
#include "scriptstopper.h"
#include <QtDBus>
#include <QDBusConnection>
#include <QtCore/QMetaObject>
#include <QtCore/QByteArray>
#include <QtCore/QList>
#include <QtCore/QMap>
#include <QtCore/QString>
#include <QtCore/QStringList>
#include <QtCore/QVariant>
#include <QDebug>
#include <QIcon>
#include <QQmlContext>

int main(int argc, char *argv[])
{ 
    QApplication app(argc, argv);
    QApplication::setWindowIcon(QIcon("qrc:/appicon.png"));
    KDEPlasmoidAdaptor KDEPlasmoidAdaptor(&app);
    ScriptLauncher launcher;
    ScriptStopper stopper;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("KDEPlasmoidAdaptor", &KDEPlasmoidAdaptor);
    engine.rootContext()->setContextProperty("scriptLauncher", &launcher);
    engine.rootContext()->setContextProperty("scriptStopper", &stopper);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    QObject *topLevel = engine.rootObjects().value(0);
    QObject::connect(topLevel,SIGNAL(submitTextField(QString)), &KDEPlasmoidAdaptor,SLOT(sendQueryFunctionSlot(QString)));
    QObject::connect(topLevel,SIGNAL(senddbussignal(QString)), &KDEPlasmoidAdaptor,SLOT(emptyslot(QString)));
    return app.exec();
}

