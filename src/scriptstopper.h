#ifndef SCRIPTSTOPPER_H
#define SCRIPTSTOPPER_H

#include <QObject>
#include <QProcess>

class ScriptStopper : public QObject
{
    Q_OBJECT

public:
   explicit ScriptStopper(QObject *parent = 0);
   Q_INVOKABLE void stopScript();

private:
    QProcess *s_process;
};

#endif // SCRIPTSTOPPER_H
