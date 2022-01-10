import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:taskf/app/core/constants/spin_kit.dart';
import 'package:taskf/app/core/services/internet_connection/internetConn.dart';
import 'package:taskf/app/core/widgets/button.dart';
import 'package:taskf/app/core/widgets/text_field.dart';
import 'package:taskf/app/core/widgets/widget_error.dart';
import 'package:taskf/app/modules/auth/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: controller.obx(
          (state) => Stack(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    child: Image.asset(
                      'assets/images/shopping_app.png',
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                  TextFieldWidget(
                      labelString: 'Name',
                      icon: Icons.person_outline,
                      textController: controller.nameController,
                      validator: 'Please enter your name'),
                  TextFieldWidget(
                    labelString: 'Password',
                    icon: Icons.lock_outline,
                    textController: controller.passwordController,
                    validator: 'Please enter your password',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ButtonWidget(
                      textButton: 'Log in',
                      onPress: () {
                        InterNetConn.checkInternetConnect();
                        controller.login(context);
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.15,
                bottom: MediaQuery.of(context).size.width * 0.15,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: InkWell(
                      child: const Text(
                        'SignUp',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () {
                        Get.offAndToNamed(Keys.signupPageKey);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          onLoading: Opacity(
            opacity: 0.4,
            child: Center(
              child: Container(
                color: Colors.blue,
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
            pageKey: Keys.loginPageKey,
          ),
        ),
      ),
    );
  }
}
