# Mycroft-Ai-QtApplication
###Qt5 Application Frontend for Mycroft Ai

#####[Under Developement]

#####Please Note: This application is dependent on Mycroft Ai Core. mycroft-core is required to be present in your '/home/$user' Directory for this application to work.

0. Changelog
1. Auto Install
2. Running The Application
3. Manual Install Requirements
4. Bugs

### [0] Changelog
   1. Release Version 0.1.1
   2. Easy one script install for *K/Ubuntu 16.04+ based distributions
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
   1. Make sure the following packages are installed: (sudo apt-get install)

      qt5-default
      qt5-qmake
      libqt5widgets5
      libqt5gui5
      libqt5qml5
      libqt5core5a
      libqt5dbus5
      libqt5network5
      libqt5network5
      libqt5quick5
      libqt5xdg1*
      python-dbus
      gettext
      python-gobject
      qml-module-qtquick2
      qml-module-qtquick-controls
      qml-module-qtquick-controls-styles-breeze
      qml-module-qtquick-layouts
      qml-module-qtquick-layouts
      qml-module-qtwebsockets
      qml-module-qt-websockets
      libqt5websockets5
      qt5-style-plugins
   
   2. Manually Please copy the following files from '/usr/lib/python2.7/dist-packages/' to '/home/
$user/.virtualenvs/mycroft/lib/python2.7/site-packages'

         1. _dbus_bindings.x86_64-linux-gnu.so File
         2. _dbus_glib_bindings.x86_64-linux-gnu.so File
         3. Dbus Folder
         4. Glib Folder
         5. Gi Folder
   
   3. Copy "start.sh" to mycroft-core-master folder
   4. Copy & Replace "listener.py" to mycroft-core/mycroft/client/speech/ folder
   5. Make gui folder in mycroft-core/mycroft/client/{here}
   5. Copy "gui.py" file to mycroft-core/mycroft/client/gui folder
   6. Run "chmod a+x Mycroft\ QtApplication"
   7. Execute Mycroft\ QtApplication AppImage 

### [4] Bugs
   1. None -> Report issue if found
