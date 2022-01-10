import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/models/user.dart';
import 'package:taskf/app/core/services/internet_connection/internetConn.dart';
import 'package:taskf/app/core/services/storage/product_storage.dart';
import 'package:taskf/app/core/services/storage/user_storage.dart';
import 'package:taskf/app/core/widgets/show_dialog_app.dart';
import 'package:taskf/app/modules/auth/auth_repository.dart';

class LoginController extends GetxController with StateMixin<dynamic> {
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  AuthRepository auth;
  ProductStorage productStorage;
  UserStorage userStorage;
  LoginController(
      {required this.auth,
      required this.productStorage,
      required this.userStorage});
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  @override
  onReady() {
    InterNetConn.checkInternetConnect();
  }

  bool isDataCompleted() {
    if (nameController!.text.trim().isEmpty ||
        passwordController!.text.trim().isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> login(context) async {
    if (!isDataCompleted()) {
      await ShowDialogApp.showDialogApp(
          context: context,
          text: 'Please fill data',
          okMethod: () {},
          cancelMethod: () {});
    } else {
      try {
        change(null, status: RxStatus.loading());
        User user = await auth.loginRequestt(
            name: nameController!.text,
            pass: passwordController!.text,
            context: context);
        userStorage.setUser(user);
        Get.offAndToNamed('HomeView');
      } catch (e) {
        change(null, status: RxStatus.success());
      }
    }
  }
}
