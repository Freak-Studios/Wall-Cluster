import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/const.dart';
import '../models/collection_model.dart';
import '../services/firestore_service.dart';
import '../widgets/build_collection_list.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({Key? key}) : super(key: key);

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  bool isError = false;
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
    FirestoreService firestoreService = FirestoreService();
    return FutureProvider<List<Collection>>.value(
      value: firestoreService.getCollections(),
      initialData: const [],
      builder: (context, child) {
        List<Collection> collections = Provider.of<List<Collection>>(context);

        if (collections.isEmpty) {
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
        return BuildCollectionList(collections: collections);
      },
    );
  }
}
