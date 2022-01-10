import 'package:get/get.dart';
import 'package:taskf/app/core/services/storage/product_storage.dart';
import 'package:taskf/app/modules/products/product_repository.dart';
import 'package:taskf/app/modules/products/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(
      () => ProductsController(
        productRepository: Get.find<ProductRepository>(),
        productStorage: Get.find<ProductStorage>(),
      ),
    );
  }
}
