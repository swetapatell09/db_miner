import 'package:db_miner/screen/home/controller/home_controller.dart';
import 'package:db_miner/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  HomeController controller = Get.put(HomeController());
  controller.changeTheme();
  runApp(
    Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routs,
        theme: controller.isLight.value ? ThemeData.light() : ThemeData.dark(),
      ),
    ),
  );
}
