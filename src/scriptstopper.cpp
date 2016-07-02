#include "scriptstopper.h"

ScriptStopper::ScriptStopper(QObject *parent) :
    QObject(parent),
    s_process(new QProcess(this))
{
}

void ScriptStopper::stopScript()
{
    s_process->start("bash MycroftServiceStop.sh");
}

