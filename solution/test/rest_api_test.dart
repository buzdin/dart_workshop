import 'package:unittest/unittest.dart';
import 'package:http/http.dart' as http;

void main() {

  test("rest-api-test", () {
    http.get('http://127.0.0.1:8080').then((response) {
      print(response.body);
    });
  });


}
