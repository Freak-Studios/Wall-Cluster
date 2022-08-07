import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wall_cluster/widgets/build_wallpaper_grid_view.dart';

import '../constants/const.dart';
import '../models/wallpaper_model.dart';
import '../services/firestore_service.dart';
import '../widgets/build_search_delegate.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage(
      {Key? key,
      @PathParam() required this.collectionId,
      required this.collectionName})
      : super(key: key);

  final String collectionId;
  final String collectionName;

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  FirestoreService firestoreService = FirestoreService();
  final ScrollController scrollController = ScrollController();
  int initialLimt = 12;
  bool isError = false;

  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 10), () {
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
      value: firestoreService.getCollectionWallpaper(widget.collectionId),
      initialData: const [],
      builder: (context, child) {
        List<Wallpaper> wallpapers = Provider.of<List<Wallpaper>>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.collectionName),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: BuildSearchDelegate());
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).primaryColor,
          body: wallpapers.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isError
                          ? Icon(Icons.error,
                              size: emptyListIconSize,
                              color: defaultAccentColor)
                          : CircularProgressIndicator(
                              color: defaultAccentColor),
                      const SizedBox(height: 10),
                      isError
                          ? Text('Oops! Something Went Wrong',
                              style: emptyListTextStyle)
                          : Text('Loading', style: emptyListTextStyle)
                    ],
                  ),
                )
              : BuildWallpaperGridView(
                  wallpapers: wallpapers,
                  scrollController: scrollController,
                  isFavPage: false,
                ),
        );
      },
    );
  }
}
