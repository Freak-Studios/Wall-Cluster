import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:wall_cluster/services/local_data_service.dart';

import 'package:wall_cluster/widgets/build_wallpaper_grid_view.dart';

import '../constants/const.dart';
import '../models/favourite_model.dart';
import '../models/wallpaper_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  LocalDataService localDataService = LocalDataService();
  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    Hive.box('favorite').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Favorite>>(
      valueListenable: localDataService.getFavorites().listenable(),
      builder: (context, value, child) {
        final List<Favorite> favorites = value.values.toList().cast<Favorite>();
        List<Wallpaper> wallpapers = [];
        for (var wallpaper in favorites) {
          wallpapers.add(wallpaper.wallpaper);
        }
        if (wallpapers.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.heart_broken,
                  color: defaultAccentColor,
                  size: emptyListIconSize,
                ),
                Text('No Favorites', style: emptyListTextStyle)
              ],
            ),
          );
        }
        // return BuildFavoriteGrid(favorites: favorites);
        return BuildWallpaperGridView(
          scrollController: scrollController,
          wallpapers: wallpapers,
          isFavPage: true,
        );
      },
    );
  }
}
