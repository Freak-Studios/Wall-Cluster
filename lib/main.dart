import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

import 'constants/theme_data_const.dart';
import 'models/favourite_model.dart';
import 'models/wallpaper_model.dart';
import 'routes/router.gr.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteAdapter());
  Hive.registerAdapter(WallpaperAdapter());
  await Hive.openBox<Favorite>('favorite');
  await Hive.openBox<Wallpaper>('wallpaper');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Wall Cluster',
        theme: lightThemeData,
        darkTheme: darkThemeData,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      );
}
