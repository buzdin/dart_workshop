import 'package:unittest/unittest.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../lib/storage.dart';

void main() {

  final String url = "mongodb://dart:dartIsKing@ds035338.mongolab.com:35338/dart-workshop";

  test("connect", () {
    new Db(url).open();
  });

  test("insert", () {
    var db = new Db(url);

    insert() {
      DbCollection tags = db.collection("tags");
      //tags.remove();
      tags.insert({
          "loc": [56, 23], "name": "Place"
      });
    }

    db.open().then((c) => insert());
  });

  test("near query", () {
    var db = new Db(url);


    query() {
      db.ensureIndex("tags", key: "loc", name: "2d");
      DbCollection tags = db.collection("tags");
      tags.find(where.near("loc", {'\$geometry': {"type" : "Point", "coordinates": [56 , 23]}}, 100)).each((v)=>print(v));
    }

    db.open().then((c) => query());
  });

  test("map to object", () {
    var doc = {"name" : "test", "loc": [52, 24]};
    saveOrUpdateTag(doc);
  });

  test("store from object", () {

  });

}
