import 'package:fukiya/fukiya.dart';
import 'dart:io';
import 'dart:json';

final database = [];

main() {
 database.add({
    "id":"123",
    "name" : "Place",
    "icon" : "http://icons.iconarchive.com/icons/babasse/bagg-and-boxs/64/Falcon-icon.png",
    "loc" : [56.91902592158822, 24.186041778564462]
 });

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
  //print(context.data);
  //print('ID : ' + context.parsedBody['name']);
  print(context.parsedBody['name']);
  context.send("OK");
}


