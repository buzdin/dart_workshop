import 'package:mongo_dart/mongo_dart.dart';

class Database {

  final String DB_URL = "mongodb://dart:dartIsKing@ds035338.mongolab.com:35338/dart-workshop";

  void insertNewPlace(Map place) {
    var db = new Db(DB_URL);

    db.open().then((c) {
      DbCollection places = db.collection("places");
      var id = new ObjectId();
      place['_id'] = id;
      places.insert(place).then((v) {
        print(place['_id']);
        db.close();
      });
    });
  }

  void fetchNearbyPlaces(double lat, double lng, callback) {
    var db = new Db(DB_URL);

    List result = new List();

    db.open().then((c) {
      db.ensureIndex("places", key: "loc", name: "2d");
      DbCollection places = db.collection("places");
      places.find(where.near("loc",
          {'\$geometry': {"type" : "Point", "coordinates" : [23, 23]}
      }, 10000)).each((place) {
        result.add(place);
      }).then((ignore) {
        callback(result);
        db.close();
      });
    });
  }

}
