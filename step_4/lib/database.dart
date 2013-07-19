library storage;

import 'package:mongo_dart/mongo_dart.dart';

final String DB_URL = "mongodb://dart:dartIsKing@ds035338.mongolab.com:35338/dart-workshop";

Future saveOrUpdateTag(Map tag) {
  var db = new Db(DB_URL);

  db.open().then((c) {
    DbCollection tags = db.collection("tags");
    var id = new ObjectId();
    tag['_id'] = id;
    Future o = tags.insert(tag);
    print (o.then((v) {
      print(tag['_id']);
    }));
  });
}

Iterable<Tag> fetchNearbyTags(double lat, double lng) {
  var db = new Db(DB_URL);

  db.open().then((c) {
    db.ensureIndex("tags", key: "loc", name: "2d");
    DbCollection tags = db.collection("tags");
    tags.find(where.near("loc", {'\$geometry': {"type" : "Point", "coordinates": [lat , lng]}}, 100))
    .each((v)=>print(v));
  });

}
