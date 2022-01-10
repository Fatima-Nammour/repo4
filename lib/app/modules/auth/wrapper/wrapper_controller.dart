import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:taskf/app/core/services/storage/product_storage.dart';
import 'package:taskf/app/core/services/storage/user_storage.dart';

class WrapperController extends GetxController with StateMixin<dynamic> {
  UserStorage userStorage;
  ProductStorage shoppingCartStorage;
  ProductStorage productStorage;
  WrapperController({
    required this.userStorage,
    required this.shoppingCartStorage,
    required this.productStorage,
  });

  @override
  void onReady() async {
    await loginOrHome();
    change(null, status: RxStatus.success());
  }

  Future<void> loginOrHome() async {
    if (userStorage.getUser() == null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Get.toNamed(Keys.loginPageKey);
      });
    } else {
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) {
          Get.toNamed('HomeView');
        },
      );
    }
  }
}
