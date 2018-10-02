#  International Space Station (ISS) Rising Times Demo

This ISS Rising Times Demo was created by Lawrence Edmondson
It has 2 UI Screens as follows:
1. Home Screen where a user sets their location
2. Results Screen where the results of the ISS Rising times for the user's given lat and long are displayed

#### Requirements
This demo has the following entries in Info.plist which are neccesary for it to run

1. Allow arbitraty loads becasue the ISS endpoint runs on http v.s. https
http://open-notify.org/Open-Notify-API/ISS-Pass-Times/

2. Privacy - Location When In Use is required becasue we need access to the user's location.

##### The following Cocoapods are installed
1. SwiftyJSON for parsing the returned JSON from the ISS endpoint

2. AlamoFire for handing the HTTP call

The pods are declared within the Podfile

