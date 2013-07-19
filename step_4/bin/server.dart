import 'package:fukiya/fukiya.dart';
import 'dart:io';
import 'dart:json';
import "database.dart";

final database = new Database();

main() {
 new Fukiya()
  ..get('/api/places', getHandler)
  ..post('/api/places', postHandler)
  ..staticFiles('web')
  ..use(new FukiyaJsonParser())
  ..listen('127.0.0.1', 8080);
}

void getHandler(FukiyaContext context) {
  print("GET");
  var near = context.params['near'];
  if (near == null) {
    context.send("near is not set");
  } else {
    print(near);
    var lat = near.split(',')[0];
    var lng = near.split(',')[1];
    database.fetchNearbyPlaces(lat, lng, (places) {
      context.jsonResponse(places);
    });
  }
}

void postHandler(FukiyaContext context) {
  print("POST");
  print(context.parsedBody);
  database.insertNewPlace(context.parsedBody);
  context.send("OK");
}


