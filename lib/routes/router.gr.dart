// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../models/wallpaper_model.dart' as _i10;
import '../pages/collection_page.dart' as _i3;
import '../pages/collections_page.dart' as _i6;
import '../pages/error_page.dart' as _i2;
import '../pages/favorites_page.dart' as _i7;
import '../pages/home_page.dart' as _i4;
import '../pages/wallpaper_page.dart' as _i1;
import '../pages/wallpapers_page.dart' as _i5;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    WallpaperRouter.name: (routeData) {
      final args = routeData.argsAs<WallpaperRouterArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.WallpaperPage(
              key: args.key,
              wallpaperId: args.wallpaperId,
              wallpaper: args.wallpaper));
    },
    ErrorRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ErrorPage());
    },
    CollectionRouter.name: (routeData) {
      final args = routeData.argsAs<CollectionRouterArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.CollectionPage(
              key: args.key,
              collectionId: args.collectionId,
              collectionName: args.collectionName));
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    },
    WallpapersRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.WallpapersPage());
    },
    CollectionsRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.CollectionsPage());
    },
    FavoritesRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FavoritesPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(WallpaperRouter.name, path: '/:wallpaperId'),
        _i8.RouteConfig(ErrorRouter.name, path: 'error'),
        _i8.RouteConfig(CollectionRouter.name,
            path: 'collections/:collectionId'),
        _i8.RouteConfig(HomeRoute.name, path: '/', children: [
          _i8.RouteConfig(WallpapersRouter.name,
              path: 'wallpapers', parent: HomeRoute.name),
          _i8.RouteConfig(CollectionsRouter.name,
              path: 'collections', parent: HomeRoute.name),
          _i8.RouteConfig(FavoritesRouter.name,
              path: 'Favorites', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.WallpaperPage]
class WallpaperRouter extends _i8.PageRouteInfo<WallpaperRouterArgs> {
  WallpaperRouter(
      {_i9.Key? key,
      required String wallpaperId,
      required _i10.Wallpaper wallpaper})
      : super(WallpaperRouter.name,
            path: '/:wallpaperId',
            args: WallpaperRouterArgs(
                key: key, wallpaperId: wallpaperId, wallpaper: wallpaper),
            rawPathParams: {'wallpaperId': wallpaperId});

  static const String name = 'WallpaperRouter';
}

class WallpaperRouterArgs {
  const WallpaperRouterArgs(
      {this.key, required this.wallpaperId, required this.wallpaper});

  final _i9.Key? key;

  final String wallpaperId;

  final _i10.Wallpaper wallpaper;

  @override
  String toString() {
    return 'WallpaperRouterArgs{key: $key, wallpaperId: $wallpaperId, wallpaper: $wallpaper}';
  }
}

/// generated route for
/// [_i2.ErrorPage]
class ErrorRouter extends _i8.PageRouteInfo<void> {
  const ErrorRouter() : super(ErrorRouter.name, path: 'error');

  static const String name = 'ErrorRouter';
}

/// generated route for
/// [_i3.CollectionPage]
class CollectionRouter extends _i8.PageRouteInfo<CollectionRouterArgs> {
  CollectionRouter(
      {_i9.Key? key,
      required String collectionId,
      required String collectionName})
      : super(CollectionRouter.name,
            path: 'collections/:collectionId',
            args: CollectionRouterArgs(
                key: key,
                collectionId: collectionId,
                collectionName: collectionName),
            rawPathParams: {'collectionId': collectionId});

  static const String name = 'CollectionRouter';
}

class CollectionRouterArgs {
  const CollectionRouterArgs(
      {this.key, required this.collectionId, required this.collectionName});

  final _i9.Key? key;

  final String collectionId;

  final String collectionName;

  @override
  String toString() {
    return 'CollectionRouterArgs{key: $key, collectionId: $collectionId, collectionName: $collectionName}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.WallpapersPage]
class WallpapersRouter extends _i8.PageRouteInfo<void> {
  const WallpapersRouter() : super(WallpapersRouter.name, path: 'wallpapers');

  static const String name = 'WallpapersRouter';
}

/// generated route for
/// [_i6.CollectionsPage]
class CollectionsRouter extends _i8.PageRouteInfo<void> {
  const CollectionsRouter()
      : super(CollectionsRouter.name, path: 'collections');

  static const String name = 'CollectionsRouter';
}

/// generated route for
/// [_i7.FavoritesPage]
class FavoritesRouter extends _i8.PageRouteInfo<void> {
  const FavoritesRouter() : super(FavoritesRouter.name, path: 'Favorites');

  static const String name = 'FavoritesRouter';
}
