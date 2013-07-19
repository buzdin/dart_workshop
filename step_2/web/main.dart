import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/google_maps.dart';

final DEFAULT_ICON = 'http://icons.iconarchive.com/icons/designbolts/monsters-university/128/Monsters-Character-Young-Mikes-icon.png';

void main() {
  initialize();
  drawMap();
}

void initialize() {
  query('#name').value = 'My Place';
  query('#icon').value = DEFAULT_ICON;
}

void drawMap() {
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
    query('#form').hidden = true;

    drawMarker(map, name, icon, event.latLng);
  });
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
