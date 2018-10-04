#  International Space Station (ISS) Rising Times Demo

This ISS Rising Times Demo was created by Lawrence Edmondson as a means to test the ISS API.

The demo has 3 UI Screens as follows:
1. Home Screen where a user sets their location
![screen 1] (https://github.com/lawrence-edmondson/iss/blob/master/readme-images/screen1.png)

2. Results Screen where the results of the ISS Rising times for the user's given lat and long are displayed
![screen 2] (https://github.com/lawrence-edmondson/iss/blob/master/readme-images/screen2.png)
![screen 3] (https://github.com/lawrence-edmondson/iss/blob/master/readme-images/screen3.png)

#### Requirements
This demo has the following entries in Info.plist which are neccesary for it to run

1. Allow arbitraty loads becasue the ISS endpoint runs on http v.s. https

http://open-notify.org/Open-Notify-API/ISS-Pass-Times/

2. Privacy - Location When In Use is required becasue we need access to the user's location.

##### The following Cocoapods are installed
1. SwiftyJSON for parsing the returned JSON from the ISS endpoint
2. AlamoFire for handing the HTTP call
3. The pods are declared within the Podfile


