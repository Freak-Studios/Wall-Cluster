import 'package:json_annotation/json_annotation.dart';

import '../utilities/camel_to_sentence.dart';

part 'collection_model.g.dart';

@JsonSerializable()
class Collection {
  final String id;
  final String name;
  final String imgLink;

  Collection({this.id = '', this.name = '', this.imgLink = ''});

  factory Collection.fromJson(Map<String, dynamic> json) {
    json['name'] = camelToSentence(json['name'] as String);
    return _$CollectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
