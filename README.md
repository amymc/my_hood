This is a responsive, location-based, events listing website. 

Built using **Ruby on Rails**, **Twitter Bootstrap** and the **Google Maps API**, it uses **HTML5 Geolocation** to detect the user's location and, based on this, returns suggestions of things-to-do nearby. 

In addition users can search the database of events by location, event type or event name. Admin users can login and update/edit the events database

Screenshots can be viewed [here] (http://amymc.github.io/my_hood/)

**Gems used**<br/>
[CanCan] (https://github.com/ryanb/cancan) - authorization library to prevent general public from accessing admin area of the site <br/>
[CarrierWave] (https://github.com/jnicklas/carrierwave)- for uploading images<br/> 
[Gmaps4rails] (https://github.com/apneadiving/Google-Maps-for-Rails) - for detecting user's location and displaying on a google map<br/>
[Ruby Geocoder] (https://github.com/alexreisner/geocoder) - for converting street addresses to lat/long co-ordinates and querying the database based on distance<br/>
[Simple Form] (https://github.com/plataformatec/simple_form) - for generating the form for updating events

Built with Ruby v 1.9 and Rails v 3.1 

Admin log in screen is at 127.0.0.1:3000/admin
admin username is nyc and password is 123
