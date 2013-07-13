library tag;

import 'dart:json' as JSON;
import 'package:web_ui/web_ui.dart';

@observable
class Tag {

  int id;
  String name;
  String image;
  int rating;
  List<double> loc;

  Map toMap() {
    var map = new Map();
    map['id'] = id;
    map['id'] = id;
    map['name'] = name;
    map['rating'] = rating;
    map['loc'] = loc;
    return map;
  }

  Tag fromMap(Map map) {
    var tag = new Tag();
    tag.id = map['id'];
    tag.name = map['name'];
    tag.rating = map['rating'];
    tag.loc = map['loc'];
    return tag;
  }

}
