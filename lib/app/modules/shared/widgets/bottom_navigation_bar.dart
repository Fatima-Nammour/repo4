import 'package:flutter/material.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:get/get.dart';

class BottomNavigationBarUsed extends StatelessWidget {
  final int index;
  const BottomNavigationBarUsed(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        switch (index) {
          case (0):
            {
              Get.offAndToNamed(Keys.productsPageKey);
            }
            break;
          case (1):
            {
              Get.toNamed(Keys.shoppingCartProductsPage);
            }
            break;
          default:
            {
              Get.toNamed(Keys.productsPageKey);
            }
        }
      },
      backgroundColor: Colors.white,
      iconSize: 30.0,
      showSelectedLabels: true,
      currentIndex: index,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.shop_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: ''),
      ],
    );
  }
}
