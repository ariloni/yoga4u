// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

// execute the initialize() function on window load (when the page is loaded)
console.log("are you working?")
google.maps.event.addDomListener(window, 'load', initialize);

function initialize() {
  var url = window.location.origin + window.location.pathname + ".json" +  window.location.search 
   $.get(url, function(results){


  
  var mapProperties = {
	  zoom: 9,
	  mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  
  // creates a new map inside the < div > element with id="googleMap", using the parameters that are passed (mapProperties).
  var map=new google.maps.Map(document.getElementById("googleMap"), mapProperties);
  var bounds = new google.maps.LatLngBounds()
  // Displays content within a popup balloon on top of a map
  var infowindow = new google.maps.InfoWindow({
  
  });

  infowindow.open(map,marker);
  var markers = []
  for (i=0;i<results.length; i++){

  	

	  var markerPosition = new google.maps.LatLng(results[i]['latitude'], results[i]['longitude'])
	  console.log(markerPosition)
	  //adds a marker
		var marker = new google.maps.Marker({
		   position: markerPosition,
		   map: map,
		   
		}
		   //animates the marker
	    );
	    marker.content = '<h5>' + results[i].first_name + ' ' + results[i].last_name+ '</h5>' +
            '<h6>' + results[i].city + ',' + results[i].state + ' ' + results[i].zipcode + '</h6>';  
	  	marker.setMap(map);
	  	bounds.extend(markerPosition)
	  	map.fitBounds(bounds);
	  	markers.push(marker)
	  	console.log(markers)
	  	map.addListener('click', function(marker, event) {
                infowindow.setContent(marker.content);
                infowindow.open(map, marker);
            });
	}
	(marker, i )
});
 
}
