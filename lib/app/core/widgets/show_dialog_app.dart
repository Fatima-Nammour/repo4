import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';

class ShowDialogApp {
  static Future<void> showDialogApp(
      {context, text, okMethod, cancelMethod}) async {
    return await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '$text',
            style: const TextStyle(color: Colors.blue),
          ),
          actions: [
            ButtonWidget(
              onPress: () {
                okMethod();
                Get.back();
              },
              textButton: 'OK',
            ),
            ButtonWidget(
              onPress: () {
                cancelMethod();
                Get.back();
              },
              textButton: 'Cancel',
            ),
          ],
        );
      },
    );
  }
}
