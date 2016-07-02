#include "scriptlauncher.h"

ScriptLauncher::ScriptLauncher(QObject *parent) :
    QObject(parent),
    m_process(new QProcess(this))
{
}

void ScriptLauncher::launchScript()
{
    m_process->start("bash MycroftServiceStart.sh");
}
