import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/models/user.dart';
import 'package:taskf/app/core/services/storage/product_storage.dart';
import 'package:taskf/app/core/services/storage/user_storage.dart';
import 'package:taskf/app/core/widgets/show_dialog_app.dart';
import 'package:taskf/app/modules/auth/auth_repository.dart';

class SignupController extends GetxController with StateMixin<dynamic> {
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? fullNameController = TextEditingController();
  final TextEditingController? cityController = TextEditingController();
  final TextEditingController? numberController = TextEditingController();

  AuthRepository authRepository;
  ProductStorage productStorage;
  UserStorage userStorage;
  SignupController(
      {required this.authRepository,
      required this.productStorage,
      required this.userStorage});
  Map? reBody;
  dynamic response;
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  bool isDataCompleted() {
    if (nameController!.text.trim().isEmpty ||
        passwordController!.text.trim().isEmpty ||
        fullNameController!.text.trim().isEmpty ||
        numberController!.text.trim().isEmpty ||
        cityController!.text.trim().isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> signUp(context) async {
    if (!isDataCompleted()) {
      await ShowDialogApp.showDialogApp(
          context: context,
          text: 'Please fill data',
          okMethod: () {},
          cancelMethod: () {});
    } else {
      try {
        change(null, status: RxStatus.loading());
        User user = await authRepository.signUpRequestt(
            nameController!.text,
            passwordController!.text,
            fullNameController!.text,
            numberController!.text,
            cityController!.text,
            context);
        userStorage.setUser(user);
        Get.offAndToNamed('HomeView');
      } catch (e) {
        change(null, status: RxStatus.success());
      }
    }
  }
}
