import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'build_about.dart';

PopupMenuButton buildPopUpMenu() {
  return PopupMenuButton(
    itemBuilder: (BuildContext context) => <PopupMenuEntry<dynamic>>[
      PopupMenuItem(
        padding: const EdgeInsets.all(0),
        child: GestureDetector(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => const BuildAbout(),
          ).whenComplete(() => context.router.pop()),
          child: Container(
            padding: const EdgeInsets.all(0),
            width: double.infinity,
            height: 40,
            child: const Center(
              child: Text('About'),
            ),
          ),
        ),
      ),
    ],
  );
}
