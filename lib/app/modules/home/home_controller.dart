import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:taskf/app/modules/products/product_repository.dart';

import 'package:taskf/app/modules/products/products_view.dart';
import 'package:taskf/app/modules/shopping_cart/shopping_cart_view.dart';

class HomeController extends GetxController with StateMixin<int> {
  int currentPage = 0;

  void changePAge(int index) {
    currentPage = index;
    update();
  }

  List<Widget> page = <Widget>[
    const ProductsView(),
    const ShoppingCartView(),
  ];

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
