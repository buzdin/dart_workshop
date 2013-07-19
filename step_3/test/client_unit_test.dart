import 'package:unittest/unittest.dart';
import '../web/main.dart';

void main() {

  test("hello world", () {
    print('Hello, Dart!');
  });

  test("2 + 2 = 4", () {
    var result = add(2, 2);
    expect(result, equals(4));
  });

}

int add(x, y) {
  return x + y;
}

