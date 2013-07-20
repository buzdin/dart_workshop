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
  var near = context.params['near'];
  // TODO use database to get places
  context.jsonResponse(places);
}

void postHandler(FukiyaContext context) {
  var place = context.parsedBody;
  // TODO use database to add place
  context.send('OK');
}


