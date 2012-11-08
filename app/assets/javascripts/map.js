
	// Google Maps global map variable
	var map;
	
	$(document).ready(function () {
        var myOptions = {
          center: new google.maps.LatLng(53.5, -7),
          zoom: 4,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
		
		map = new google.maps.Map(document.getElementById("map"), myOptions);
    	
	    $('#go').click(function () {
	        // test for presence of geolocation
	        if (navigator && navigator.geolocation) {
	            // make the request for the user's position
	            navigator.geolocation.getCurrentPosition(geo_success, geo_error);
	        } else {
	           error('Geolocation is not supported.');
	        }
	    });
	});

	function geo_success(position) {
	    printAddress(position.coords.latitude, position.coords.longitude);
	}

	function geo_error(err) {
	    if (err.code == 1) {
	        error('The user denied the request for location information.')
	    } else if (err.code == 2) {
	        error('Your location information is unavailable.')
	    } else if (err.code == 3) {
	        error('The request to get your location timed out.')
	    } else {
	        error('An unknown error occurred while requesting your location.')
	    }
	}

	// use Google Maps API to reverse geocode your location
	function printAddress(latitude, longitude) {
	    // Create a Google Maps Geocoder object
	    var geocoder = new google.maps.Geocoder();

	    // Change coordinates into a location 
	    var yourLocation = new google.maps.LatLng(latitude, longitude);
	
	
		//Setup map and position on map
    	var myOptions = {
        	zoom: 15,
        	mapTypeId: google.maps.MapTypeId.ROADMAP,
        	center: yourLocation
    	}
    	map = new google.maps.Map(document.getElementById("map"), myOptions);

		// To add the marker to the map set it up then call setMap();
		var marker = new google.maps.Marker({
		    position: yourLocation,
		   map: map,
		    title: 'You are here',
		    icon: 'http://gmaps-samples.googlecode.com/svn/trunk/markers/pink/blank.png',
		   
		});
		
		//var infowindow = new google.maps.InfoWindow({
		//content:''
		//});
		
		// Adding a click event to the marker
		google.maps.event.addListener(marker, 'click', function() {
		// Calling the open method of the infoWindow
		infowindow.open(map, marker);
		});
			
		marker.setMap(map);

	    // Use Google maps to find out about the location
	    geocoder.geocode({ 'latLng': yourLocation }, function (results, status) {
	        if (status == google.maps.GeocoderStatus.OK) {
	            if (results[0]) {
	                $('#local').html('Your Address:<br />' +
	                    results[0].formatted_address);
	            } else {
	                error('Google did not return any results.');
	            }
	        } else {
	            error("Reverse Geocoding failed due to: " + status);
	        }
	    });
	}

	function error(msg) {
	    alert(msg);
	}
