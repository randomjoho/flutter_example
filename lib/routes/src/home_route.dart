// ignore_for_file: avoid_classes_with_only_static_members

import 'package:example/modules/home/bindings/home_binding.dart';
import 'package:example/modules/home/bindings/search_binding.dart';
import 'package:example/modules/home/example_page.dart';
import 'package:example/modules/home/home_page.dart';
import 'package:example/modules/home/search_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class HomeRoutes {
  static const String home = '/';
  static const String search = '/search';
  static const String example = '/example';

  static List<GetPage> pages = <GetPage>[
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: search,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: example,
      page: () => const ExamplePage(),
      transition: Transition.fadeIn,
    ),
  ];
}
