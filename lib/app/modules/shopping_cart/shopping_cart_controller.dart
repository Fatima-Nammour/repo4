import 'package:get/get.dart';
import 'package:taskf/app/core/models/products.dart';
import 'package:taskf/app/core/services/storage/product_storage.dart';
import 'package:taskf/app/core/services/storage/user_storage.dart';
import 'package:taskf/app/core/widgets/show_dialog_app.dart';

class ShoppingCartController extends GetxController with StateMixin<dynamic> {
  ProductStorage shoppingCartStorage;
  ShoppingCartController(
      {required this.shoppingCartStorage, required this.user});
  UserStorage user;
  List<Product>? shoppingCartProducts;

  void setShoppingCartProductsFromBox() {
    shoppingCartProducts = shoppingCartStorage.getAllBox();
  }

  @override
  void onInit() {
    setShoppingCartProductsFromBox();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onReady() {
    setShoppingCartProductsFromBox();
    change(null, status: RxStatus.success());
    super.onReady();
  }

  void updateUser(context, index) async {
    await ShowDialogApp.showDialogApp(
        context: context,
        text: 'Are you sure to delete?',
        okMethod: () {
          shoppingCartStorage.removeProduct(shoppingCartProducts![index].id);
          setShoppingCartProductsFromBox();
          update();
        },
        cancelMethod: () {
          // Get.back();
        });
  }
}
