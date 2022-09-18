import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utilities/camel_to_sentence.dart';

part 'wallpaper_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Wallpaper {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imgLink;
  @HiveField(3)
  final List<String> collectionIds;
  @HiveField(4)
  final String res;
  @HiveField(5)
  final bool isDark;
  @HiveField(6)
  final String tImgLink;

  Wallpaper({
    this.id = '',
    this.name = '',
    this.imgLink =
        'https://firebasestorage.googleapis.com/v0/b/wall-cluster.appspot.com/o/wallpapers%2F4.png?alt=media&token=750782f9-96d2-45cd-a04f-bfd17f6b7bc2',
    this.collectionIds = const [""],
    this.res = '2400*4880',
    this.isDark = true,
    this.tImgLink =
        'https://firebasestorage.googleapis.com/v0/b/wall-cluster.appspot.com/o/wallpapers%2F4.png?alt=media&token=750782f9-96d2-45cd-a04f-bfd17f6b7bc2',
  });

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    json['name'] = camelToSentence(json['name'] as String);
    return _$WallpaperFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WallpaperToJson(this);
}
