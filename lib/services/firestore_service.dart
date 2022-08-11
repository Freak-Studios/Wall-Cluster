import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wall_cluster/models/tag_model.dart';

import '../models/collection_model.dart';
import '../models/wallpaper_model.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference wallpapersRef =
      FirebaseFirestore.instance.collection("wallpapers");
  final CollectionReference collectionsRef =
      FirebaseFirestore.instance.collection("collections");
  final CollectionReference tagsRef =
      FirebaseFirestore.instance.collection("tags");

  Future<List<Wallpaper>> getWallpapers(int limit) {
    var results = wallpapersRef
        .orderBy('uploadDate', descending: true)
        .limit(limit)
        .get()
        .then((value) => value.docs);
    return results.then((value) => value.map((e) {
          Map<String, dynamic> data = e.data() as Map<String, dynamic>;
          data['id'] = e.id;
          return Wallpaper.fromJson(data);
        }).toList());
  }

  Future<List<Collection>> getCollections() {
    var results = collectionsRef.get().then((value) => value.docs);
    return results.then((value) => value.map((e) {
          Map<String, dynamic> data = e.data() as Map<String, dynamic>;
          data['id'] = e.id;
          return Collection.fromJson(data);
        }).toList());
  }

  Future<List<Tag>> getSearcTag(String query, int limit) {
    var results = tagsRef
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThan: '$query\uf8ff')
        .limit(limit)
        .get()
        .then((value) => value.docs);
    return results.then((value) => value.map((e) {
          Map<String, dynamic> data = e.data() as Map<String, dynamic>;
          data['id'] = e.id;
          return Tag.fromJson(data);
        }).toList());
  }

  Future<List<String>> getSearcTagWallpaperIds(List<Tag> tags) async {
    List<String> wallpaperIds = [];

    for (var element in tags) {
      for (var element in element.wallpaperIds) {
        if (!wallpaperIds.contains(element)) {
          wallpaperIds.add(element);
        }
      }
    }

    return wallpaperIds.reversed.toList();
  }

  Future<Wallpaper> getWallpaperById(String docId) {
    var results = wallpapersRef.doc(docId).get();
    return results.then((value) {
      Map<String, dynamic> data = value.data() as Map<String, dynamic>;
      data['id'] = value.id;
      return Wallpaper.fromJson(data);
    });
  }

  Future<List<Wallpaper>> getTagSearchWallpaper(String query, int limit) async {
    List<Tag> tags = await getSearcTag(query, limit);
    List<String> wallpaperIds = await getSearcTagWallpaperIds(tags);
    List<Wallpaper> wallpapers = [];
    await Future.forEach(wallpaperIds, (element) async {
      Wallpaper wallpaper = await getWallpaperById(element.toString());
      wallpapers.add(wallpaper);
    });
    return wallpapers;
  }

  Future<List<Wallpaper>> getCollectionWallpaper(String collectionId) {
    var results = wallpapersRef
        .where('collectionIds', arrayContains: collectionId)
        .get()
        .then((value) => value.docs);
    return results.then((value) => value.map((e) {
          Map<String, dynamic> data = e.data() as Map<String, dynamic>;
          data['id'] = e.id;
          return Wallpaper.fromJson(data);
        }).toList());
  }
}
