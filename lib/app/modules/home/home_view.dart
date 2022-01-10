import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/widgets/drawer_app.dart';
import 'package:taskf/app/modules/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        endDrawer: DrawerApp(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            controller.changePAge(index);
          },
          backgroundColor: Colors.white,
          iconSize: 30.0,
          showSelectedLabels: true,
          currentIndex: controller.currentPage,
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
        ),
        backgroundColor: Colors.white,
        body: controller.obx(
          (state) => Center(
            child: controller.page[controller.currentPage],
          ),
        ),
      ),
    );
  }
}
