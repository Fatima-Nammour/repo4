import 'package:get/get.dart';
import 'package:taskf/app/core/services/storage/product_storage.dart';
import 'package:taskf/app/core/services/storage/user_storage.dart';
import 'package:taskf/app/modules/auth/signup/signup_controller.dart';
import 'package:taskf/app/modules/auth/auth_repository.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(
        authRepository: Get.find<AuthRepository>(),
        productStorage: Get.find<ProductStorage>(),
        userStorage: Get.find<UserStorage>(),
      ),
    );
  }
}
