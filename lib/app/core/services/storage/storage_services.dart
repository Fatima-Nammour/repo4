import 'dart:developer';

import 'package:objectbox/objectbox.dart';
import 'package:taskf/objectbox.g.dart';

class StorageService {
  StorageService._internal();
  Store? store;
  Future openDatabaseStore() async {
    try {
      store = await openStore();
    } on ObjectBoxException catch (e) {
      log("ObjectBoxException from openDatabaseStore: $e");
    }
  }

  static final StorageService instance = StorageService._internal();
}
