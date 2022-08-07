import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../constants/const.dart';
import '../routes/router.gr.dart';
import '../widgets/build_pop_up_menu.dart';
import '../widgets/build_search_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _appbarHeading = [
    'Wall Cluster',
    'Collections',
    'Favorites'
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) => AppBar(
        title: Text(_appbarHeading[tabsRouter.activeIndex]),
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: BuildSearchDelegate()),
            icon: const Icon(Icons.search),
          ),
          buildPopUpMenu()
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      routes: const [
        WallpapersRouter(),
        CollectionsRouter(),
        FavoritesRouter()
      ],
      bottomNavigationBuilder: ((context, tabsRouter) => SalomonBottomBar(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: [
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.window_outlined,
                  size: normalIconSize,
                ),
                title: const Text('Wallpapers'),
                selectedColor: Theme.of(context).colorScheme.secondary,
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.collections_outlined,
                  size: normalIconSize,
                ),
                title: const Text('Collections'),
                selectedColor: Theme.of(context).colorScheme.secondary,
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.favorite_outline_outlined,
                  size: normalIconSize,
                ),
                title: const Text('Favorites'),
                selectedColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          )),
    );
  }
}
