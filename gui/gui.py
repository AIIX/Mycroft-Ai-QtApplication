# Copyright 2016 Mycroft AI, Inc.
#
# This file is part of Mycroft Core.
#
# Mycroft Core is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Mycroft Core is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Mycroft Core.  If not, see <http://www.gnu.org/licenses/>.


import sys
import dbus
import dbus.mainloop.glib
from threading import Thread, Lock

from mycroft.messagebus.client.ws import WebsocketClient
from mycroft.messagebus.message import Message
from mycroft.tts import tts_factory
from mycroft.util.log import getLogger
from traceback import print_exc
from gi.repository import GLib

tts = tts_factory.create()
client = None
mutex = Lock()
logger = getLogger("CLIClient")
guioutputstring = ''

def handle_speak(event):
    mutex.acquire()
    client.emit(Message("recognizer_loop:audio_output_start"))
    try:
        utterance = event.metadata.get('utterance')
        logger.info("Speak: " + utterance)
	global guioutputstring	
	guioutputstring = utterance
	logger.info("guioutputstring: " + guioutputstring)	
	dbusout()
        #tts.execute(utterance)
    finally:
        mutex.release()
        client.emit(Message("recognizer_loop:audio_output_end"))

def dbusout():
	bus = dbus.SessionBus()
	remote_object = bus.get_object("com.mycroftkde.KDEPlasmoid","/ComMycroftkdeKDEPlasmoidInterface")  
	setText = remote_object.setText(guioutputstring,dbus_interface = "com.mycroftkde.KDEPlasmoid")

def connect():
    client.run_forever()

def catchInput(queryInput):
	bus = dbus.SessionBus()
	remote_object = bus.get_object("com.mycroftkde.KDEPlasmoid","/ComMycroftkdeKDEPlasmoidInterface")  
	global client
    	client = WebsocketClient()
    	if '--quiet' not in sys.argv:
        	client.on('speak', handle_speak)
    	event_thread = Thread(target=connect)
    	event_thread.setDaemon(True)
    	event_thread.start()
    	try:
    	    while True:
    	        print("DebuggingGui")
    	        line = remote_object.sendQuery(guioutputstring,dbus_interface = "com.mycroftkde.KDEPlasmoid")
    	        client.emit(
    	            Message("recognizer_loop:utterance",
    	                    metadata={'utterances': [line.strip()]}))
		line = ("")
		return 
    	except KeyboardInterrupt, e:
    	    logger.exception(e)
    	    event_thread.exit()
	    sys.exit()	

def main():
	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
	bus = dbus.SessionBus()
	try:
	   bus.add_signal_receiver(catchInput, dbus_interface = "com.mycroftkde.KDEPlasmoid", signal_name = "signalQueryReady")

	except dbus.DBusException:
	   traceback.print_exc()
	   print ("Error")
	   sys.exit()	

	loop = GLib.MainLoop()
	loop.run()

if __name__ == "__main__":
	main()
