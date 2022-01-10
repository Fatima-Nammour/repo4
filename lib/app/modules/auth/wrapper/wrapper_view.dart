import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/modules/auth/wrapper/wrapper_controller.dart';

class WrapperView extends GetView<WrapperController> {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Container(
        color: Colors.black,
      ),
      onLoading: Container(color: Colors.white),
    );
  }
}
