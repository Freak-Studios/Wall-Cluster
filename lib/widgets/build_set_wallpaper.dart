import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wall_cluster/models/wallpaper_model.dart';
import 'package:async_wallpaper/async_wallpaper.dart';

import '../constants/const.dart';

class BuildSetWallpaper extends StatefulWidget {
  const BuildSetWallpaper({Key? key, required this.wallpaper})
      : super(key: key);

  final Wallpaper wallpaper;

  @override
  State<BuildSetWallpaper> createState() => _BuildSetWallpaperState();
}

class _BuildSetWallpaperState extends State<BuildSetWallpaper> {
  late Timer _timer;
  bool isLoading = false;

  void startLoading() {
    setState(() => isLoading = true);
    _timer = Timer(const Duration(seconds: 5), () {
      context.router.pop();
      setState(() => isLoading = false);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).colorScheme.brightness;

    void setWallpaper({required int screen}) {
      startLoading();
      DefaultCacheManager().getFileFromCache(widget.wallpaper.id).then(
          (value) =>
              AsyncWallpaper.setWallpaperFromFile(value!.file.path, screen));
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: !isLoading
            ? Container(
                padding: const EdgeInsets.all(20),
                width: 250,
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Apply',
                      style: smallTextHeadingStyle,
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: (() =>
                          setWallpaper(screen: AsyncWallpaper.HOME_SCREEN)),
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Set Home Screen',
                            style: TextStyle(
                              fontSize: dialougeContentTextSize,
                              color: brightness == Brightness.light
                                  ? Colors.black54
                                  : Colors.white60,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (() =>
                          setWallpaper(screen: AsyncWallpaper.LOCK_SCREEN)),
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Set Lock Screen',
                            style: TextStyle(
                              fontSize: dialougeContentTextSize,
                              color: brightness == Brightness.light
                                  ? Colors.black54
                                  : Colors.white60,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (() =>
                          setWallpaper(screen: AsyncWallpaper.BOTH_SCREENS)),
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Set Both Screen',
                            style: TextStyle(
                              fontSize: dialougeContentTextSize,
                              color: brightness == Brightness.light
                                  ? Colors.black54
                                  : Colors.white60,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: Text(
                        'Cancel',
                        style: alertDialogTextStyle,
                      ),
                    ),
                  ],
                ),
              )
            : CircularProgressIndicator(color: defaultAccentColor),
      ),
    );
  }
}
