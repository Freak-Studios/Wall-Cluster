import 'package:json_annotation/json_annotation.dart';

import '../utilities/camel_to_sentence.dart';

part 'tag_model.g.dart';

@JsonSerializable()
class Tag {
  final String id;
  final String name;
  final List<String> wallpaperIds;

  Tag({this.id = '', this.name = '', this.wallpaperIds = const ['']});

  factory Tag.fromJson(Map<String, dynamic> json) {
    json['name'] = camelToSentence(json['name'] as String);
    return _$TagFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
