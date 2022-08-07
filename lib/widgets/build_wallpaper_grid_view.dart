import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/wallpaper_model.dart';
import '../routes/router.gr.dart';
import 'build_wallpaper_card.dart';

class BuildWallpaperGridView extends StatelessWidget {
  const BuildWallpaperGridView({
    Key? key,
    required this.wallpapers,
    required this.isFavPage,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;
  final List<Wallpaper> wallpapers;
  final bool isFavPage;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).colorScheme.brightness;
    return GridView.builder(
      controller: scrollController,
      itemCount: wallpapers.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (BuildContext context, int index) {
        Wallpaper wallpaper = wallpapers[index];
        return GestureDetector(
          onTap: () => context.router.push(
            WallpaperRouter(wallpaperId: wallpaper.id, wallpaper: wallpaper),
          ),
          child: BuildWallpaperCard(
            wallpaper: wallpaper,
            brightness: brightness,
            isFavPage: isFavPage,
          ),
        );
      },
    );
  }
}
