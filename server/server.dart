import 'dart:io';
import 'dart:json';

main() {

  HttpServer.bind('127.0.0.1', 8080).then((server) {
    server.listen((HttpRequest request) {

      var document = stringify({
          'key': '42',
          'value': 'eternity'}
      );

      request.response.write(document);
      request.response.close();
    });
  });

}
