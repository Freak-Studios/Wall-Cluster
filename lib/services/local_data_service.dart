import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import '../models/favourite_model.dart';
import '../models/wallpaper_model.dart';

class LocalDataService {
  Box<Favorite> getFavorites() => Hive.box<Favorite>('favorite');

  Future addFavorite({required Wallpaper wallpaper}) async {
    late final Favorite favorite;
    final box = getFavorites();
    bool idExists = false;
    for (Favorite element in box.values) {
      if (element.wallpaper == wallpaper) {
        idExists = true;
        favorite = element;
      }
    }
    if (idExists) {
      box.delete(favorite.key);
    } else {
      favorite = Favorite(wallpaper: wallpaper);
      box.put(wallpaper.id, favorite);
    }
  }

  bool wallpaperExists({required Wallpaper wallpaper}) {
    final box = getFavorites();
    bool idExists = false;
    for (Favorite element in box.values) {
      if (element.wallpaper == wallpaper) {
        idExists = true;
      }
    }
    return idExists;
  }
}
