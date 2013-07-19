import 'dart:html';
import 'dart:json';
import 'dart:async';
import 'package:js/js.dart' as js;
import 'package:google_maps/google_maps.dart';

final DEFAULT_ICON = 'http://icons.iconarchive.com/icons/designbolts/monsters-university/128/Monsters-Character-Young-Mikes-icon.png';

void main() {
  var map = drawMap();
  initialize(map);
}

void initialize(map) {
  query('#name').value = 'My Place';
  query('#icon').value = DEFAULT_ICON;

  loadPlaces(map);

  new Timer(new Duration(seconds:5), () {
    print("timer triggered");
    loadPlaces(map);
  });
}

GMap drawMap() {
  js.context.google.maps.visualRefresh = true;

  final mapOptions = new MapOptions()..zoom = 13..center = new LatLng(56.946843515558456, 24.13162512207032)..mapTypeId = MapTypeId.ROADMAP;
  final map = new GMap(query("#map_canvas"), mapOptions);
  js.retain(map);

  map.onCenterChanged.listen((ignore) {
    print(map.center);
  });

  map.onZoomChanged.listen((ignore) {
    print(map.zoom);
  });

  map.onClick.listen((event) {
    print(event.latLng);
    var name = query('#name').value;
    var icon = query('#icon').value;

    savePlace(name, icon, event.latLng);
    drawMarker(map, name, icon, event.latLng);
  });

  return map;
}

void loadPlaces(GMap map) {
  var lat = map.center.lat;
  var lng = map.center.lng;
  HttpRequest.getString("/api/places?near=$lat,$lng}").then((response) {
    var points = parse(response);
    for (final point in points) {
      var latLng = new LatLng(point['loc'][0], point['loc'][1]);
      drawMarker(map, point['name'], point['icon'], latLng);
    }
  });
}

void savePlace(name, icon, latLng) {
  var place = {
      "name" : name,
      "icon" : icon,
      "loc" : [latLng.lat, latLng.lng]
  };

  var json = stringify(place);

  var request = new HttpRequest();
  request.open('POST', '/api/places');
  request.setRequestHeader("Content-Type", "application/json");
  request.send(json);
}

void drawMarker(map, name, icon, latLng) {
  var marker = new Marker(
      new MarkerOptions()
      ..position = latLng
      ..map = map
      ..title = name
      ..icon = icon
  );
}
