import 'package:get/get.dart';
import 'package:taskf/app/core/services/storage/product_storage.dart';
import 'package:taskf/app/core/services/storage/user_storage.dart';
import 'package:taskf/app/modules/auth/login/login_controller.dart';
import 'package:taskf/app/modules/auth/auth_repository.dart';

//import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
          auth: Get.find<AuthRepository>(),
          productStorage: Get.find<ProductStorage>(),
          userStorage: Get.find<UserStorage>(),
        ));
  }
}
