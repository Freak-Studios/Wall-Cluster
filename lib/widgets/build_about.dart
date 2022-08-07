import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wall_cluster/constants/const.dart';

class BuildAbout extends StatelessWidget {
  const BuildAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).colorScheme.brightness;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 250,
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'About',
                  style: smallTextHeadingStyle,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Wall Cluster',
                    style: TextStyle(
                      fontSize: dialougeContentTextSize,
                      color: brightness == Brightness.light
                          ? Colors.black54
                          : Colors.white60,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Version: 1.0.0',
                    style: TextStyle(
                        fontSize: dialougeContentTextSize,
                        color: brightness == Brightness.light
                            ? Colors.black54
                            : Colors.white60),
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
