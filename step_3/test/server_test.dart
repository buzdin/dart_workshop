import 'package:unittest/unittest.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() {

  test("should-get", () {
    http.get('http://127.0.0.1:8080/api/places?near=1,2').then(expectAsync1((response) {
      expect(response.statusCode, equals(200));
      expect(response.body, equals('[]'));
    }));
  });  
  
  test("should-post", () {
    new HttpClient().postUrl(Uri.parse("http://127.0.0.1:8080/api/places")).then((request) {
      request.headers.contentType = new ContentType("application", "json", charset: "utf-8");
      request.write('{"id":"1", "name":"Name", "icon":".png"}');
      return request.close();
    }).then(expectAsync1((response) {
      expect(response.statusCode, equals(200));
      expect(response.body, equals('OK'));
    }));
    
    new HttpClient().getUrl(Uri.parse("http://127.0.0.1:8080/api/places?near=1,2")).then((request) {      
      return request.close();
    }).then(expectAsync1((response) {
      expect(response.statusCode, equals(200));
      expect(response.body, equals('[]'));
    }));
  });

}
