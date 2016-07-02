# Mycroft-Ai-QtApplication
###Qt5 Application Frontend for Mycroft Ai

#####[Under Developement Expect Bugs]

#####Please Note: This application is dependent on Mycroft Ai Core. mycroft-core-master is required to be present in your '/home/$user' Directory for this application to work.

0. Changelog
1. Requirements
2. Running The Application
3. Bugs

### [0] Changelog
   1. Initial Commit Version 0.1

### [1] Requirements
   1. Qt5
   2. Qt5Quick (min version: QtQuick 2.0)
   3. Qt5Dbus
   4. Qt5Gui
   5. Qt5Widgets
   6. Qt5Network

### [2] Running The Application
   1. Copy "start.sh" to mycroft-core-master folder
   2. Copy & Replace "listener.py" to mycroft-core-master/mycroft/client/speech/ folder
   3. Copy "gui" folder to mycroft-core-master/mycroft/client/ folder
   4. Copy files from your '/usr/lib/python2.7/dist-packages/' to '/home/$user/.virtualenvs/mycroft/lib/python2.7/site-packages' Files: *dbus folder *dbus bindings file *dbus glib binding file *gi folder *glib folder *gobject folder
   5. Run "chmod a+x Mycroft\ QtApplication"
   6. Execute Mycroft\ QtApplication AppImage 

### [3] Bugs
   1. Text Input Does Not Register -> (Resend the text) -> if it still doesnt register -> (Resend the text) [Text input is not recommended to use]
