import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/google_maps.dart';

// This is Dart Web Application bootstrap

void main() {

  js.context.google.maps.visualRefresh = true;

  final mapOptions = new MapOptions()
  ..zoom = 13
  ..center = new LatLng(56.946843515558456, 24.13162512207032)
  ..mapTypeId = MapTypeId.ROADMAP
  ;
  final map = new GMap(query("#map_canvas"), mapOptions);
  js.retain(map);

  map.onCenterChanged.listen((ignore) {
    print(map.center);
  });

  map.onZoomChanged.listen((ignore) {
    print(map.zoom);
  });
}

void sayHello() {
  print("Hello");
}