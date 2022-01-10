import 'package:get/get.dart';
import 'package:taskf/app/core/services/storage/product_storage.dart';
import 'package:taskf/app/core/services/storage/user_storage.dart';
import 'package:taskf/app/modules/shopping_cart/shopping_cart_controller.dart';

class ShoppingCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ShoppingCartController>(
      ShoppingCartController(
        shoppingCartStorage: Get.find<ProductStorage>(),
        user: Get.find<UserStorage>(),
      ),
    );
  }
}
