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
  var near = context.params['near'];
  print(near);
  context.jsonResponse(database);
}

void postHandler(FukiyaContext context) {
  print(context.parsedBody);
  database.add(context.parsedBody);
  context.send("OK");
}


