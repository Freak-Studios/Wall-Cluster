import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wall_cluster/widgets/build_wallpaper_grid_view.dart';

import '../constants/const.dart';
import '../models/wallpaper_model.dart';
import '../services/firestore_service.dart';

class WallpapersPage extends StatefulWidget {
  const WallpapersPage({Key? key}) : super(key: key);

  @override
  State<WallpapersPage> createState() => _WallpapersPageState();
}

class _WallpapersPageState extends State<WallpapersPage> {
  final ScrollController scrollController = ScrollController();
  final FirestoreService firestoreService = FirestoreService();
  bool isError = false;
  int initialLimt = 12;

  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        isError = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.width * 0.2;
      if (maxScroll - currentScroll <= delta) {
        setState(() => initialLimt = initialLimt + 12);
      }
    });
    return FutureProvider<List<Wallpaper>>.value(
      value: firestoreService.getWallpapers(initialLimt),
      initialData: const [],
      builder: (context, child) {
        List<Wallpaper> wallpapers = Provider.of<List<Wallpaper>>(context);

        if (wallpapers.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isError
                    ? Icon(Icons.error,
                        color: defaultAccentColor, size: emptyListIconSize)
                    : CircularProgressIndicator(color: defaultAccentColor),
                const SizedBox(height: 10),
                isError
                    ? Text(
                        'Oops! Something Went Wrong',
                        style: emptyListTextStyle,
                      )
                    : Text('Loading', style: emptyListTextStyle),
                if (isError)
                  TextButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('refresh', style: alertDialogTextStyle),
                  ),
              ],
            ),
          );
        }
        return BuildWallpaperGridView(
          wallpapers: wallpapers,
          scrollController: scrollController,
          isFavPage: false,
        );
      },
      catchError: (context, error) {
        return [];
      },
    );
  }
}
