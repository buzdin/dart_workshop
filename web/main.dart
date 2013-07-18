import 'package:js/js.dart' as js;
import 'package:google_maps/google_maps.dart';
import 'dart:html';
import 'dart:async';

// This is Dart Web Application bootstrap
void main() {

  // Event loop to check for updates
  new Timer(new Duration(seconds:5), () => print('timer'));

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

  map.onClick.listen((event) {
    print(event.latLng);
    query('#place_form').hidden = true;
    HttpRequest.getString("/").then((s) => print(s));
  });

  var marker = new Marker(
      new MarkerOptions()
      ..position = new LatLng(56.946843515558456, 24.13162512207032)
      ..map = map
      ..title = 'Foo'
      ..icon = './img/heart.png'
  );
}

void sayHello() {
  print("Hello");
}
