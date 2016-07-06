#!/bin/bash

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' qt5-default|grep "install ok installed")
echo Checking for qt5-default: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "qt5-default package not installed. Setting up qt5-default."
  sudo apt-get --force-yes --yes install qt5-default
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' qt5-qmake|grep "install ok installed")
echo Checking for qt5-qmake: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "qt5-qmake package not installed. Setting up qt5-qmake."
  sudo apt-get --force-yes --yes install qt5-qmake
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libqt5widgets5|grep "install ok installed")
echo Checking for libqt5widgets5: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "libqt5widgets5 package not installed. Setting up libqt5widgets5."
  sudo apt-get --force-yes --yes install libqt5widgets*
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libqt5gui5|grep "install ok installed")
echo Checking for libqt5gui5: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "libqt5gui5 package not installed. Setting up libqt5gui5."
  sudo apt-get --force-yes --yes install libqt5gui*
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libqt5qml5|grep "install ok installed")
echo Checking for libqt5qml5: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "libqt5qml5 package not installed. Setting up libqt5qml5."
  sudo apt-get --force-yes --yes install libqt5qml*
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libqt5core5a|grep "install ok installed")
echo Checking for libqt5core5a: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "libqt5core5a package not installed. Setting up libqt5core5a."
  sudo apt-get --force-yes --yes install libqt5core*
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libqt5dbus5|grep "install ok installed")
echo Checking for libqt5dbus5: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "libqt5dbus5 package not installed. Setting up libqt5dbus5."
  sudo apt-get --force-yes --yes install libqt5dbus*
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libqt5network5|grep "install ok installed")
echo Checking for libqt5network5: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "libqt5network5 package not installed. Setting up libqt5network5."
  sudo apt-get --force-yes --yes install libqt5network5*
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libqt5quick*|grep "install ok installed")
echo Checking for libqt5quick: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "libqt5quick package not installed. Setting up libqt5quick."
  sudo apt-get --force-yes --yes install libqt5quick5
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libqt5xdg1*|grep "install ok installed")
echo Checking for libqt5xdg1: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "libqt5xdg1 package not installed. Setting up libqt5xdg1."
  sudo apt-get --force-yes --yes install libqt5xdg1*
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' python-dbus|grep "install ok installed")
echo Checking for python-dbus: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "python-dbus package not installed. Setting up python-dbus."
  sudo apt-get --force-yes --yes install python-dbus
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' gettext|grep "install ok installed")
echo Checking for gettext: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "gettext package not installed. Setting up gettext."
  sudo apt-get --force-yes --yes install gettext
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' python-gobject|grep "install ok installed")
echo Checking for python-gobject: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "python-gobject package not installed. Setting up python-gobject."
  sudo apt-get --force-yes --yes install python-gobject
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' python-gobject|grep "install ok installed")
echo Checking for python-gobject: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "python-gobject package not installed. Setting up python-gobject."
  sudo apt-get --force-yes --yes install python-gobject
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' qml-module-qtquick2|grep "install ok installed")
echo Checking for qml-module-qtquick2: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "qml-module-qtquick2 package not installed. Setting up qml-module-qtquick2."
  sudo apt-get --force-yes --yes install qml-module-qtquick2
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' qml-module-qtquick-controls|grep "install ok installed")
echo Checking for qml-module-qtquick-controls: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "qml-module-qtquick-controls package not installed. Setting up qml-module-qtquick-controls."
  sudo apt-get --force-yes --yes install qml-module-qtquick-controls
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' qml-module-qtquick-layouts|grep "install ok installed")
echo Checking for qml-module-qtquick-layouts: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "qml-module-qtquick-layouts package not installed. Setting up qml-module-qtquick-layouts."
  sudo apt-get --force-yes --yes install qml-module-qtquick-layouts
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' qml-module-qtwebsockets|grep "install ok installed")
echo Checking for qml-module-qtwebsockets: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "qml-module-qtwebsockets package not installed. Setting up qml-module-qtwebsockets."
  sudo apt-get --force-yes --yes install qml-module-qtwebsockets
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' qml-module-qt-websockets|grep "install ok installed")
echo Checking for qml-module-qt-websockets: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "qml-module-qt-websockets package not installed. Setting up qml-module-qt-websockets."
  sudo apt-get --force-yes --yes install qml-module-qt-websockets
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libqt5websockets5|grep "install ok installed")
echo Checking for libqt5websockets5: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "libqt5websockets5 package not installed. Setting up libqt5websockets5."
  sudo apt-get --force-yes --yes install libqt5websockets5
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' qt5-style-plugins|grep "install ok installed")
echo Checking for qt5-style-plugins: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "qt5-style-plugins package not installed. Setting up qt5-style-plugins."
  sudo apt-get --force-yes --yes install qt5-style-plugins
fi
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' qml-module-qtquick-controls-styles-breeze|grep "install ok installed")
echo Checking for qml-module-qtquick-controls-styles-breeze: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "qml-module-qtquick-controls-styles-breeze package not installed. Setting up qml-module-qtquick-controls-styles-breeze."
  sudo apt-get --force-yes --yes install qml-module-qtquick-controls-styles-breeze
fi

sudo cp -R /usr/lib/python2.7/dist-packages/dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
sudo cp -R /usr/lib/python2.7/dist-packages/dbus/* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
sudo cp -R /usr/lib/python2.7/dist-packages/_dbus* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
sudo cp -R /usr/lib/python2.7/dist-packages/gi* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
sudo cp -R /usr/lib/python2.7/dist-packages/gi/* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
sudo cp -R /usr/lib/python2.7/dist-packages/glib* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
sudo cp -R /usr/lib/python2.7/dist-packages/glib/* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
sudo cp -R /usr/lib/python2.7/dist-packages/gobject* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
sudo cp -R /usr/lib/python2.7/dist-packages/gobject/* /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/
sudo chmod -R 777 /home/$USER/.virtualenvs/mycroft/lib/python2.7/site-packages/ > /dev/null
mkdir /home/$USER/mycroft-core/mycroft/client/gui
cp gui.py /home/$USER/mycroft-core/mycroft/client/gui/
cp listener.py /home/$USER/mycroft-core/mycroft/client/speech/
cp start.sh /home/$USER/mycroft-core/
chmod -R 777 Mycroft\ QtApplication > /dev/null
echo "Qt5 Application Dependency Installation Completed"
