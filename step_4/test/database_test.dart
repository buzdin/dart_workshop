import 'package:unittest/unittest.dart';
import '../bin/database.dart';

void main() {

  test("should-insert", () {
    var db = new Database();
    db.insertNewPlace({"name": "Name", "loc" : [1, 2], "icon" : "png"});
  });

}
