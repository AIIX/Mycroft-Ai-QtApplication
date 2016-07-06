# Mycroft-Ai-QtApplication
###Qt5 Application Frontend for Mycroft Ai

#####[Under Developement]

#####Please Note: This application is dependent on Mycroft Ai Core. mycroft-core-master is required to be present in your '/home/$user' Directory for this application to work.

0. Changelog
1. Auto Install
1. Manual Install Requirements
2. Running The Application
3. Bugs

### [0] Changelog
   1. Release Version 0.1.1
   2. Easy one script install for *K/Ubuntu 15.10+ based distributions
   3. Updated User Interface
   4. Voice reactive animations
   5. Text bugs fixed
   6. Initial Integration of Application Indicator 

### [1] Auto Install Script
   1. Download the git repo
   2. Post Mycroft Ai Core installation run script ./qtappdeps.sh

### [2] Running The Application
   1. Launch application
   2. Start Mycroft Service .. Wait for connect message
   3. Click Connect

### [3] Manual Requirements
   1. Qt5
   2. Qt5Quick (min version: QtQuick 2.0)
   3. Qt5Dbus
   4. Qt5Gui
   5. Qt5Widgets
   6. Qt5Network
   7. Qt5Websocket
   8. QML-Quick modules
   9. QML-Quick controls modules
   10.QML-Websockets modules
   11. Copy "start.sh" to mycroft-core-master folder
   12. Copy & Replace "listener.py" to mycroft-core-master/mycroft/client/speech/ folder
   13. Copy "gui" folder to mycroft-core-master/mycroft/client/ folder
   14. Copy files from your '/usr/lib/python2.7/dist-packages/' to '/home/$user/.virtualenvs/mycroft/lib/python2.7/site-packages' Files: *dbus folder *dbus bindings file *dbus glib binding file *gi folder *glib folder *gobject folder
   15. Run "chmod a+x Mycroft\ QtApplication"
   16. Execute Mycroft\ QtApplication AppImage 

### [3] Bugs
   1. None -> Report issue if found
