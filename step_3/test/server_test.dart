import 'package:unittest/unittest.dart';
import 'package:http/http.dart' as http;

void main() {

  test("should-get", () {
    http.get('http://127.0.0.1:8080').then((response) {
      expect(response.statusCode, equals(200));
      expect(response.body, equals('[]'));
    });
  });

  test("should-post", () {
    http.post('http://127.0.0.1:8080', fields: {'id':1, 'name':'Name', 'icon':'.png'}).then((response) {
      expect(response.statusCode, equals(200));
      expect(response.body, equals('OK'));
    });

    http.get('http://127.0.0.1:8080').then((response) {
      expect(response.statusCode, equals(200));
      expect(response.body, equals('[]'));
    });
  });

}
