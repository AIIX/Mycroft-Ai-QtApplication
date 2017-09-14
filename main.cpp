#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "scriptlauncher.h"
#include "iconscriptlauncher.h"
#include <QIcon>
#include <QtWebSockets/QtWebSockets>
#include <QMessageBox>
#include <QAction>
#include <QMenu>
#include <QSystemTrayIcon>
#include <QQuickStyle>
#include "msmapp.h"
#include "filereader.h"
#include <QtWebEngine/qtwebengineglobal.h>

int main(int argc, char *argv[])
{ 
    QApplication app(argc, argv);
    QtWebEngine::initialize();
    QApplication::setWindowIcon(QIcon(":/images/mycroft-plasma-appicon.png"));
    qmlRegisterType<ScriptLauncher>("MycroftLauncher", 1, 0, "ScriptLauncher");
    qmlRegisterType<MsmApp>("MsmInstaller", 1, 0, "MsmApp");
    qmlRegisterType<FileReader>("MsmFileReader", 1, 0, "FileReader");

    if (!QSystemTrayIcon::isSystemTrayAvailable()) {
                QMessageBox::critical(0, QObject::tr("Systray"),
                                         QObject::tr("I couldn't detect any system tray "
                                                     "on this system."));
                return 1;
            }
    QApplication::setQuitOnLastWindowClosed(false);
    iconscriptlauncher imlauncher;
    QWebSocket imsocket;
    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    QObject *root = 0;
            if (engine.rootObjects().size() > 0)
            {
                root = engine.rootObjects().at(0);
                QAction *restoreAction = new QAction(QObject::tr("&Show"), root);
                root->connect(restoreAction, SIGNAL(triggered()), root, SLOT(showNormal()));
                QAction *quitAction = new QAction(QObject::tr("&Quit"), root);
                root->connect(quitAction, SIGNAL(triggered()), qApp, SLOT(quit()));
                QAction *registerAction = new QAction(QObject::tr("&Pair My Device"), root);
                root->connect(registerAction, SIGNAL(triggered()), &imlauncher, SLOT(registerscript()));

                QMenu *trayIconMenu = new QMenu();
                trayIconMenu->addAction(restoreAction);
                trayIconMenu->addSeparator();
                trayIconMenu->addAction(registerAction);
                trayIconMenu->addAction(quitAction);

                QSystemTrayIcon *trayIcon = new QSystemTrayIcon(root);
                trayIcon->setContextMenu(trayIconMenu);
                trayIcon->setIcon(QIcon(":/images/mycroft-plasma-appicon.png"));
                trayIcon->show();
                trayIcon->connect(restoreAction, SIGNAL(triggered()), root, SLOT(showNormal()));
            }

    return app.exec();
}

