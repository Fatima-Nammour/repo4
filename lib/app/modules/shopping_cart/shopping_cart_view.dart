import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:taskf/app/core/constants/spin_kit.dart';
import 'package:taskf/app/core/widgets/widget_error.dart';
import 'package:taskf/app/modules/shared/widgets/empty_shopping_cart.dart';
import 'package:taskf/app/modules/shared/widgets/product_card.dart';
import 'package:taskf/app/modules/shopping_cart/shopping_cart_controller.dart';

class ShoppingCartView extends GetView<ShoppingCartController> {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: content(context),
    ));
  }

  Widget content(context) {
    controller.setShoppingCartProductsFromBox();
    if (controller.shoppingCartProducts!.isNotEmpty) {
      return controller.obx(
        (state) => ListView.builder(
          itemCount: controller.shoppingCartProducts!.length,
          itemBuilder: (BuildContext context, int index) => ProductCard(
            isShoppCartProduct: true,
            product: controller.shoppingCartProducts![index],
            onPressDetail: () {
              Get.toNamed(Keys.productDetailedPageKey,
                  arguments: controller.shoppingCartProducts![index]);
            },
            onPressAddOrDelete: () {
              controller.updateUser(context, index);
            },
          ),
        ),
        onLoading: Opacity(
          opacity: 0.4,
          child: Container(
            color: Colors.black,
            child: Column(
              children: const [
                SpinKitApp(),
                Text('Please wait'),
              ],
            ),
          ),
        ),
        onError: (error) => const WidgetError(
          pageKey: '',
        ),
      );
    } else {
      return const EmptyShoppingCartPage();
    }
  }
}
