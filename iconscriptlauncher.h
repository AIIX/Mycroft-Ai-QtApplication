#ifndef ICONSCRIPTLAUNCHER_H
#define ICONSCRIPTLAUNCHER_H

#include <QObject>
#include <QProcess>

class iconscriptlauncher : public QObject
{
     Q_OBJECT

public:
    explicit iconscriptlauncher(QObject *parent = 0);
    Q_INVOKABLE void imlaunchscript();
    Q_INVOKABLE void imstopscript();
    Q_INVOKABLE void registerscript();

signals:
    void newsignal();

private:
    QProcess *im_process;
    QProcess *reg_process;
    QProcess *ims_process;
};

#endif // ICONSCRIPTLAUNCHER_H
