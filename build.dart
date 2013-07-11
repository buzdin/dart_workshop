import 'package:web_ui/component_build.dart';
import 'dart:io';

// Automatic compilation of source code files
void main() {
  build(new Options().arguments, ['web/index.html']);
}
