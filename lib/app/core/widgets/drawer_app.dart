import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/services/storage/product_storage.dart';
import 'package:taskf/app/core/services/storage/user_storage.dart';

import 'button.dart';

class DrawerApp extends StatelessWidget {
  DrawerApp({Key? key}) : super(key: key);
  final UserStorage userStorage = Get.find<UserStorage>();
  final ProductStorage shoppingCart = Get.find<ProductStorage>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 100.0,
      child: ListView(
        children: [
          ButtonWidget(
            onPress: () async {
              await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Are you sure to logout?\nShoopping Cart Products will be removed!',
                        style: TextStyle(color: Colors.blue),
                      ),
                      actions: [
                        ButtonWidget(
                          onPress: () {
                            //delete user from local storage & delete shoppingCart
                            shoppingCart.removeAllProducts();
                            userStorage.removeUser();
                            Get.back();
                          },
                          textButton: 'OK',
                        ),
                        ButtonWidget(
                          onPress: () {
                            Get.back();
                          },
                          textButton: 'Cancel',
                        ),
                      ],
                    );
                  });
            },
            textButton: 'Log out',
          ),
        ],
      ),
    );
  }
}
