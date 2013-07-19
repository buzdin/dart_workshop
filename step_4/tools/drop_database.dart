final String DB_URL = "mongodb://dart:dartIsKing@ds035338.mongolab.com:35338/dart-workshop";

// Run this to create 2d index - db.places.ensureIndex( { "loc": "2d" } )
void main() {
  var db = new Db(DB_URL);

  db.open().then((c) {
    DbCollection places = db.collection("places");
    places.remove();
  });
}
