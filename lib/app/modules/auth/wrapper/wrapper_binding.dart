import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:taskf/app/core/dio/dio.dart';
import 'package:taskf/app/core/services/storage/product_storage.dart';
import 'package:taskf/app/core/services/storage/user_storage.dart';
import 'package:taskf/app/core/widgets/widget_error.dart';
import 'package:taskf/app/modules/auth/wrapper/wrapper_controller.dart';
import 'package:taskf/app/modules/auth/auth_repository.dart';
import 'package:taskf/app/modules/products/product_repository.dart';
import 'package:taskf/app/modules/products/products_controller.dart';
import 'package:taskf/app/modules/shopping_cart/shopping_cart_controller.dart';

class WrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      DioFactory.dioSetUp(),
    ); //Inject Dio object
    Get.put(
      AuthRepository(
        Get.find<Dio>(),
      ),
    ); //Inject AuthRepository object
    Get.put(
      UserStorage(),
    );
    Get.put(
      ProductStorage(),
    );
    Get.put(
      ProductRepository(
        Get.find<Dio>(),
      ),
    );
    Get.put(
      WidgetError(
        pageKey: Keys.productsPageKey,
      ),
    );
    Get.lazyPut<ProductsController>(
      () => ProductsController(
        productRepository: Get.find<ProductRepository>(),
        productStorage: Get.find<ProductStorage>(),
      ),
    );
    Get.lazyPut<ShoppingCartController>(
      () => ShoppingCartController(
        shoppingCartStorage: Get.find<ProductStorage>(),
        user: Get.find<UserStorage>(),
      ),
    );
    Get.put(
      WrapperController(
        userStorage: Get.find<UserStorage>(),
        productStorage: Get.find<ProductStorage>(),
        shoppingCartStorage: Get.find<ProductStorage>(),
      ),
    );
  }
}
