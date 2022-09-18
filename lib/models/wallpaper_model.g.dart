// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WallpaperAdapter extends TypeAdapter<Wallpaper> {
  @override
  final int typeId = 1;

  @override
  Wallpaper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wallpaper(
      id: fields[0] as String,
      name: fields[1] as String,
      imgLink: fields[2] as String,
      collectionIds: (fields[3] as List).cast<String>(),
      res: fields[4] as String,
      isDark: fields[5] as bool,
      tImgLink: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Wallpaper obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imgLink)
      ..writeByte(3)
      ..write(obj.collectionIds)
      ..writeByte(4)
      ..write(obj.res)
      ..writeByte(5)
      ..write(obj.isDark)
      ..writeByte(6)
      ..write(obj.tImgLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WallpaperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallpaper _$WallpaperFromJson(Map<String, dynamic> json) => Wallpaper(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imgLink: json['imgLink'] as String? ??
          'https://firebasestorage.googleapis.com/v0/b/wall-cluster.appspot.com/o/wallpapers%2F4.png?alt=media&token=750782f9-96d2-45cd-a04f-bfd17f6b7bc2',
      collectionIds: (json['collectionIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [""],
      res: json['res'] as String? ?? '2400*4880',
      isDark: json['isDark'] as bool? ?? true,
      tImgLink: json['tImgLink'] as String? ??
          'https://firebasestorage.googleapis.com/v0/b/wall-cluster.appspot.com/o/wallpapers%2F4.png?alt=media&token=750782f9-96d2-45cd-a04f-bfd17f6b7bc2',
    );

Map<String, dynamic> _$WallpaperToJson(Wallpaper instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgLink': instance.imgLink,
      'collectionIds': instance.collectionIds,
      'res': instance.res,
      'isDark': instance.isDark,
      'tImgLink': instance.tImgLink,
    };
