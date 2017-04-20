#include "iconscriptlauncher.h"

iconscriptlauncher::iconscriptlauncher(QObject *parent) :
    QObject(parent),
    im_process(new QProcess(this)), reg_process(new QProcess(this)), ims_process(new QProcess(this))
{
}

void iconscriptlauncher::imlaunchscript()
{
    im_process->start("bash MycroftServiceStart.sh");
}

void iconscriptlauncher::registerscript()
{
    reg_process->start("firefox http://home.mycroft.ai/");
}

void iconscriptlauncher::imstopscript()
{
    ims_process->start("bash MycroftServiceStop.sh");
}
