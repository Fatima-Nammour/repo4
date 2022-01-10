import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:taskf/app/core/constants/spin_kit.dart';
import 'package:taskf/app/core/services/internet_connection/internetConn.dart';
import 'package:taskf/app/core/widgets/button.dart';
import 'package:taskf/app/core/widgets/text_field.dart';
import 'package:taskf/app/core/widgets/widget_error.dart';
import 'package:taskf/app/modules/auth/signup/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

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
                  //textField name
                  TextFieldWidget(
                      labelString: 'Name',
                      icon: Icons.person_outline,
                      textController: controller.nameController,
                      validator: 'Please enter your name'),
                  //textField password
                  TextFieldWidget(
                      labelString: 'Full Name',
                      icon: Icons.lock_outline,
                      textController: controller.fullNameController,
                      validator: 'Please enter your fullName'),
                  TextFieldWidget(
                      labelString: 'Password',
                      icon: Icons.lock_outline,
                      textController: controller.passwordController,
                      validator: 'Please enter your password'),
                  TextFieldWidget(
                      labelString: 'Phone Number',
                      icon: Icons.lock_outline,
                      textController: controller.numberController,
                      validator: 'Please enter your number'),
                  TextFieldWidget(
                      labelString: 'City',
                      icon: Icons.lock_outline,
                      textController: controller.cityController,
                      validator: 'Please enter your phone number'),

                  //SignUp Button
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ButtonWidget(
                      textButton: 'Sign up',
                      onPress: () {
                        InterNetConn.checkInternetConnect();
                        controller.signUp(context);
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
                        'Log in',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () {
                        Get.offAndToNamed(Keys.loginPageKey);
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
            pageKey: Keys.signupPageKey,
          ),
        ),
      ),
    );
  }
}
