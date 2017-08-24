## Mycroft AI Standalone GUI Client Version 1.3
##### Standalone GUI client for Mycroft written in QT, support for all Desktop Environments
###### Appimage Release - Comes bundled with all the QT/GUI Dependencies
 
What's New: 
* added: Fullscreen support, ability to resize in windowed mode
* added: New conversation model allows visual feedback for skill results
* added: Web-view integration for skills with HTML type data
* added: New conversation animation
* added: Inbuilt Installation feature for all skills listed in mycroft-skills directly from the application using MSM Skill Installer
* added: Drag and Drop to conversation area for Image/File Recognition type skills
* added: To settings ability to set custom drag and drop (Image/File) recognition command  
* changed: Redesign for better space management and dedicated animations bar

#### AppImage:
* Appimage for the Qt Application for any desktop environment (Linux).
* Download -> chmod +x mycroft-qtapplication.AppImage -> Run

### Building From Source: 

#### QT5 Requirements:
* Qt5
* QtQuick 2.0
* QtQml Models 2.2
* QtQuick Controls 2.0
* QtQuick Layouts 1.3
* Qt Websockets 1.0
* Qt Webkit 3.0
* Qt Webkit Experimental 1.0
* QtQuick Controls Styles 1.4
* Qt Creator (QT IDE FOR APP DEVELOPMENT)

#### Build Instructions:
- Git clone https://github.com/AIIX/Mycroft-Ai-QtApplication/
- Open Qt Creator
- Select Open Project
- Select mycroft-qtapplication.pro file 
- Check for Errors, Missing Dependencies
- Build & Run
