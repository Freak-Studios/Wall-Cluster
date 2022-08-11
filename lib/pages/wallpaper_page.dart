import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wall_cluster/services/local_data_service.dart';
import 'package:wall_cluster/widgets/build_wallpaper_info.dart';

import '../constants/const.dart';
import '../models/wallpaper_model.dart';
import '../widgets/build_set_wallpaper.dart';

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({
    Key? key,
    @PathParam() required this.wallpaperId,
    required this.wallpaper,
  }) : super(key: key);

  final Wallpaper wallpaper;
  final String wallpaperId;

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  LocalDataService localDataService = LocalDataService();

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.wallpaper.imgLink,
      cacheManager: DefaultCacheManager(),
      cacheKey: widget.wallpaper.id,
      errorWidget: (context, url, error) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
          elevation: 0,
          title: Text(
            widget.wallpaper.name,
            style: smallTextHeadingStyle,
          ),
        ),
        body: Center(
          child: Text('No internet connection', style: emptyListTextStyle),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
          elevation: 0,
          title: Text(
            widget.wallpaper.name,
            style: smallTextHeadingStyle,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(
                color: defaultAccentColor,
                value: progress.progress,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            if (progress.progress != null)
              Text("${(progress.progress! * 100).toInt()} %")
          ],
        ),
      ),
      imageBuilder: (context, image) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
            elevation: 0,
            title: Text(
              widget.wallpaper.name,
              style: smallTextHeadingStyle,
            ),
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              constraints: const BoxConstraints(maxHeight: 75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                BuildWallpaperInfo(wallpaper: widget.wallpaper),
                          );
                        },
                        icon: Icon(
                          Icons.info_outline,
                          size: normalIconSize,
                        ),
                      ),
                      Text('Info', style: emptyListTextStyle)
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => BuildSetWallpaper(
                            wallpaper: widget.wallpaper,
                          ),
                        ),
                        icon: Icon(
                          Icons.wallpaper,
                          size: normalIconSize,
                        ),
                      ),
                      Text(
                        'Apply',
                        style: emptyListTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            localDataService.addFavorite(
                                wallpaper: widget.wallpaper);
                          });
                        },
                        icon: localDataService
                                .getFavorites()
                                .containsKey(widget.wallpaper.id)
                            ? Icon(Icons.favorite, size: favoriteIconSize)
                            : Icon(Icons.favorite_outline,
                                size: favoriteIconSize),
                      ),
                      Text('Favorite', style: emptyListTextStyle)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
