library storage;

import 'package:mongo_dart/mongo_dart.dart';

final String url = "mongodb://dart:dartIsKing@ds035338.mongolab.com:35338/dart-workshop";

Future saveOrUpdateTag(Map tag) {
  var db = new Db(url);
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

Tag loadTag(int id) {

}

Iterable<Tag> fetchNearbyTags(double lat, double long) {

}
