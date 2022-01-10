import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskf/app/core/constants/keys.dart';
import 'package:taskf/app/core/helpers/routing/app_routing_pages.dart';
import 'package:taskf/app/core/services/storage/storage_services.dart';
import 'package:taskf/app/core/theme/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.instance.openDatabaseStore();
  runApp(
    GetMaterialApp(
      title: "Task",
      initialRoute: Keys.wrapperPageKey,
      getPages: AppPages.appRoutes,
      debugShowCheckedModeBanner: false,
      textDirection: TextDirection.ltr,
      theme: CustomTheme.lightTheme,
    ),
  );
}
