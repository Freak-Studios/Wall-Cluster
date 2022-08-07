// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      wallpaperIds: (json['wallpaperIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [''],
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'wallpaperIds': instance.wallpaperIds,
    };
