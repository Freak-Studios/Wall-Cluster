import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/const.dart';
import '../models/favourite_model.dart';
import '../models/wallpaper_model.dart';
import '../services/local_data_service.dart';

class BuildWallpaperCard extends StatefulWidget {
  const BuildWallpaperCard({
    Key? key,
    required this.wallpaper,
    required this.brightness,
    this.isFavPage = false,
  }) : super(key: key);

  final Wallpaper wallpaper;
  final Brightness brightness;
  final bool isFavPage;

  @override
  State<BuildWallpaperCard> createState() => _BuildWallpaperCardState();
}

class _BuildWallpaperCardState extends State<BuildWallpaperCard> {
  LocalDataService localDataService = LocalDataService();
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.wallpaper.imgLink,
      cacheManager: DefaultCacheManager(),
      cacheKey: widget.wallpaper.id,
      placeholder: (context, url) => Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:
              Theme.of(context).appBarTheme.foregroundColor?.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: defaultAccentColor,
          ),
        ),
      ),
      fit: BoxFit.cover,
      imageBuilder: (context, image) => Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image,
            filterQuality: FilterQuality.low,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: defaultAccentColor.withOpacity(0.3),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // if (widget.isFavPage)
                ValueListenableBuilder(
                  valueListenable: Hive.box<Favorite>('favorite').listenable(),
                  builder: (context, value, child) => IconButton(
                    onPressed: () {
                      setState(() {
                        localDataService.addFavorite(
                            wallpaper: widget.wallpaper);
                      });
                    },
                    icon: localDataService
                            .getFavorites()
                            .containsKey(widget.wallpaper.id)
                        ? Icon(
                            Icons.favorite,
                            size: favoriteIconSize,
                            color: darkForegroundColor,
                          )
                        : Icon(Icons.favorite_outline,
                            color: darkForegroundColor, size: favoriteIconSize),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
