import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:taskf/app/core/constants/spin_kit.dart';
import 'package:taskf/app/core/widgets/widget_error.dart';
import 'package:taskf/app/modules/shared/widgets/product_card.dart';
import 'package:taskf/app/modules/products/products_controller.dart';

//import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
            // appBar: AppBar(
            //   backgroundColor: Colors.blue,
            //   leading: IconButton(
            //     onPressed: () {
            //       controller.refreshProducts();
            //     },
            //     icon: const Icon(
            //       Icons.refresh_outlined,
            //       color: Colors.white,
            //     ),
            //   ),
            // )
            // endDrawer: DrawerApp(),
            // bottomNavigationBar: const BottomNavigationBarUsed(0),
            Material(
      child: controller.obx(
        (state) => Column(
          children: [
            IconButton(
              onPressed: () {
                controller.refreshProducts();
              },
              icon: const Icon(
                Icons.refresh_outlined,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) => ProductCard(
                  isShoppCartProduct: false,
                  product: controller.products[index],
                  onPressDetail: () {
                    Get.toNamed(Keys.productDetailedPageKey,
                        arguments: controller.products[index]);
                  },
                  onPressAddOrDelete: () {
                    controller.createAndStoreShoppingCartProduct(
                        controller.products[index]);
                  },
                ),
                itemCount: controller.products.length,
              ),
            ),
          ],
        ),
        onLoading: Opacity(
          opacity: 0.4,
          child: Center(
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SpinKitApp(),
                  Text('Please wait\nWe get the products'),
                ],
              ),
            ),
          ),
        ),
        onError: (error) => WidgetError(
          pageKey: Keys.productsPageKey,
        ),
      ),
    ));
  }
}
