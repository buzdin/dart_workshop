import 'package:fukiya/fukiya.dart';
import 'dart:io';
import 'dart:json';

final database = [];

main() {
 new Fukiya()
  ..get('/api/places', getHandler)
  ..post('/api/places', postHandler)
  ..staticFiles('web')
  ..use(new FukiyaJsonParser())
  ..listen('127.0.0.1', 8080);
}

void getHandler(FukiyaContext context) {
  // TODO handle GET request
}

void postHandler(FukiyaContext context) {
  // TODO handle POST request
}


