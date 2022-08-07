import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/const.dart';
import '../models/collection_model.dart';
import '../routes/router.gr.dart';

class BuildCollectionList extends StatelessWidget {
  const BuildCollectionList({
    Key? key,
    required this.collections,
  }) : super(key: key);

  final List<Collection> collections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        Collection collection = collections[index];
        return GestureDetector(
          onTap: () => context.router.push(CollectionRouter(
            collectionId: collection.id,
            collectionName: collection.name,
          )),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(collection.imgLink),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
              ),
              child: Center(
                  child: Text(collection.name, style: smallTextHeadingStyle)),
            ),
          ),
        );
      },
    );
  }
}
