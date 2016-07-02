class ServerExampleTwo : public QObject
{
    Q_OBJECT
    // define the dbus interface name
    Q_CLASSINFO("D-Bus Interface", "ch.bbv.anotherTest");
    Q_SCRIPTABLE Q_PROPERTY( QString user READ user) // export
public:
    explicit ServerExampleTwo(QObject *parent = 0);
    QString user() const; // export via property
    void doNotExportData();
private:
    QString _user;
public slots:
    Q_SCRIPTABLE void setUser(const QString& user); // export
    Q_SCRIPTABLE void setSomething(const QString& input); // export
    Q_SCRIPTABLE QString setReply();
    void doNotExportSlot(int test);
signals:
    Q_SCRIPTABLE void userChanged(QString user); //export
    void doNotExportSignal(QString user);
};