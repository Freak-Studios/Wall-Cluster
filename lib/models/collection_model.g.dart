// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imgLink: json['imgLink'] as String? ?? '',
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgLink': instance.imgLink,
    };
