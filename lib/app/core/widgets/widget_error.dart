import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';

class WidgetError extends StatelessWidget {
  final String pageKey;

  const WidgetError({Key? key, required this.pageKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset(
              'assets/images/access_denied.png',
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.5),
              margin:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Text(
                'Something wrong!',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            ButtonWidget(
              textButton: 'Back',
              onPress: () {
                Get.toNamed(pageKey);
              },
            )
          ],
        ),
      ),
    );
  }
}
