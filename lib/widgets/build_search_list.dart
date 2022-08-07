import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wall_cluster/services/firestore_service.dart';
import 'package:wall_cluster/widgets/build_wallpaper_grid_view.dart';

import '../constants/const.dart';
import '../models/wallpaper_model.dart';

class BuildSearchList extends StatefulWidget {
  const BuildSearchList({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  State<BuildSearchList> createState() => _BuildSearchListState();
}

class _BuildSearchListState extends State<BuildSearchList> {
  final FirestoreService firestoreService = FirestoreService();
  final ScrollController scrollController = ScrollController();
  int initialLimt = 12;
  bool isLoading = false;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        isLoading = true;
      });
    });
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
        value:
            firestoreService.getTagSearchWallpaper(widget.query, initialLimt),
        initialData: const [],
        builder: (context, child) {
          List<Wallpaper> wallpapers = Provider.of<List<Wallpaper>>(context);
          if (widget.query.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_outlined,
                    size: emptyListIconSize,
                  ),
                  Text(
                    'Search Here',
                    style: emptyListTextStyle,
                  )
                ],
              ),
            );
          }
          if (wallpapers.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isLoading
                      ? Icon(
                          Icons.wallpaper_sharp,
                          color: defaultAccentColor,
                          size: emptyListIconSize,
                        )
                      : CircularProgressIndicator(
                          color: defaultAccentColor,
                        ),
                  const SizedBox(height: 10),
                  isLoading
                      ? Text(
                          'No Such Wallpaper',
                          style: emptyListTextStyle,
                        )
                      : Text(
                          'Loading',
                          style: emptyListTextStyle,
                        )
                ],
              ),
            );
          }

          return BuildWallpaperGridView(
            wallpapers: wallpapers,
            scrollController: scrollController,
            isFavPage: false,
          );
        });
  }
}
