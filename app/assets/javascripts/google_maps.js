var map;
var infowindow;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: {lat: 32.776 , lng: -79.931 },
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  for (var person in person_info_hash) {
    var image = {
      url: person_info_hash[person].image_url,
      size: new google.maps.Size(32, 32),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(16, 16)
    };
    var markers = new google.maps.Marker({
      position: person_info_hash[person].marker_location,
      map: map,
      title: person,
      icon: image,
      zIndex: 99999
    });
    var content = person_info_hash[person].info_window_text
    infowindow = new google.maps.InfoWindow();
    
    mouseoverAndMouseoutEvents(markers, content, infowindow);
  }
  console.log(search['query'])
  addBarsToMap(person_info_hash, map, search['query']);
  addCirclesToMap(person_info_hash, map);
  
  addSmallerCirclesToMap(circle_one, map);
  addSmallerCirclesToMap(circle_two, map);
  addSmallerCirclesToMap(circle_three, map);
  addSmallerCirclesToMap(circle_four, map);
  addSmallerCirclesToMap(birth_name_circle, map);
}

function addBarsToMap(hash, map, search_query){
  for (var person in hash) {
    var bar_markers = new google.maps.places.PlacesService(map);
    bar_markers.nearbySearch({
      location: hash[person].marker_location,
      radius: hash[person].radius,
      types: search_query
    }, callback);
  }
}

function addCirclesToMap(hash, map){
  for (var person in hash) {
    var circles = new google.maps.Circle({
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: '#FF0000',
      fillOpacity: 0.35,
      map: map,
      center: hash[person].marker_location,
      radius: hash[person].radius
    });
  }
} 

function addSmallerCirclesToMap(hash, map){
  for (var person in hash) {
    var circles = new google.maps.Circle({
      strokeColor: hash[person].circle_color,
      strokeOpacity: 0.9,
      strokeWeight: 2.5,
      fillColor: hash[person].circle_color,
      fillOpacity: 0.05,
      map: map,
      center: hash[person].marker_location,
      radius: hash[person].api_radius
    });
  }
} 

function mouseoverAndMouseoutEvents(markers, content, infowindow){
  google.maps.event.addListener(markers, 'mouseover', (function(markers, content, infowindow){
    return function(){
      infowindow.setContent(content);
      infowindow.open(map, markers);
    };
  })(markers, content, infowindow));

  google.maps.event.addListener(markers, 'mouseout', (function(markers, content, infowindow){
    return function(){
      infowindow.close();
    };
  })(markers, content, infowindow));
}

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createBarMarkers(results[i]);
    }
  }
}

function createBarMarkers(place) {
  var marker = new google.maps.Marker({
    position: place.geometry.location,
    map: map,
    title: place.name
  });
}