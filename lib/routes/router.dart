import 'package:auto_route/auto_route.dart';

import '../pages/collection_page.dart';
import '../pages/collections_page.dart';
import '../pages/error_page.dart';
import '../pages/favorites_page.dart';
import '../pages/home_page.dart';
import '../pages/wallpaper_page.dart';
import '../pages/wallpapers_page.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(
    path: '/:wallpaperId',
    name: 'WallpaperRouter',
    page: WallpaperPage,
  ),
  AutoRoute(
    path: 'error',
    name: 'ErrorRouter',
    page: ErrorPage,
  ),
  AutoRoute(
    path: 'collections/:collectionId',
    name: 'CollectionRouter',
    page: CollectionPage,
  ),
  AutoRoute(path: '/', page: HomePage, initial: true, children: [
    AutoRoute(
      path: 'wallpapers',
      name: 'WallpapersRouter',
      page: WallpapersPage,
    ),
    AutoRoute(
      path: 'collections',
      name: 'CollectionsRouter',
      page: CollectionsPage,
    ),
    AutoRoute(
      path: 'Favorites',
      name: 'FavoritesRouter',
      page: FavoritesPage,
    ),
  ]),
], replaceInRouteName: 'Page,Route')
class $AppRouter {}
