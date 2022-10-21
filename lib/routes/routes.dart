// ignore_for_file: avoid_classes_with_only_static_members

import 'package:example/routes/src/home_route.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> pages = [
    // 以下集成各个模块路由
    ...HomeRoutes.pages
  ];

  static Future<T?> toNamed<T>(
    String name, {
    dynamic arguments,
  }) {
    return Get.toNamed<T?>(
          name,
          arguments: arguments,
        ) ??
        Future<T>.value();
  }
}
