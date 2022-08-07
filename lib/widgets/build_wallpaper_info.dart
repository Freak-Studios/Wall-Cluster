import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wall_cluster/models/wallpaper_model.dart';

import '../constants/const.dart';

class BuildWallpaperInfo extends StatelessWidget {
  const BuildWallpaperInfo({Key? key, required this.wallpaper})
      : super(key: key);

  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).colorScheme.brightness;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  'Wallpaper Info',
                  style: smallTextHeadingStyle,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    'Name: ${wallpaper.name}',
                    style: TextStyle(
                      fontSize: dialougeContentTextSize,
                      color: brightness == Brightness.light
                          ? Colors.black54
                          : Colors.white60,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Resolution: ${wallpaper.res}',
                    style: TextStyle(
                      fontSize: dialougeContentTextSize,
                      color: brightness == Brightness.light
                          ? Colors.black54
                          : Colors.white60,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    wallpaper.isDark ? 'Theme: Dark' : 'Theme: Light',
                    style: TextStyle(
                      fontSize: dialougeContentTextSize,
                      color: brightness == Brightness.light
                          ? Colors.black54
                          : Colors.white60,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  context.router.pop();
                },
                child: Text(
                  'Ok',
                  style: alertDialogTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
