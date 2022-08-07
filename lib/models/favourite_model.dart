import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'wallpaper_model.dart';

part 'favourite_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Favorite extends HiveObject {
  @HiveField(0)
  final Wallpaper wallpaper;

  Favorite({required this.wallpaper});

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteToJson(this);
}
