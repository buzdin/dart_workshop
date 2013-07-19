import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/google_maps.dart';


// This is Dart Web Application bootstrap
void main() {

  // TODO Draw your Google Map

}

void drawMarker(map, latLng) {
  var marker = new Marker(
      new MarkerOptions()
      ..position = latLng
      ..map = map
      ..title = 'Foo'
      ..icon = 'http://icons.iconarchive.com/icons/designbolts/monsters-university/128/Monsters-Character-Young-Mikes-icon.png'
      // TODO pick your icon
  );
}
