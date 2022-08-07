// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteAdapter extends TypeAdapter<Favorite> {
  @override
  final int typeId = 0;

  @override
  Favorite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favorite(
      wallpaper: fields[0] as Wallpaper,
    );
  }

  @override
  void write(BinaryWriter writer, Favorite obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.wallpaper);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favorite _$FavoriteFromJson(Map<String, dynamic> json) => Favorite(
      wallpaper: Wallpaper.fromJson(json['wallpaper'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteToJson(Favorite instance) => <String, dynamic>{
      'wallpaper': instance.wallpaper,
    };
