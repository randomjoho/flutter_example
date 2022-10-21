import 'package:example/bindings/initial_binding.dart';
import 'package:example/data/local/data_base.dart';
import 'package:example/http/dio_utils.dart';
import 'package:example/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 配置网络环境
  DioUtils.updateUri(Uri.parse('https://itunes.apple.com'));
  // 初始化数据库
  await AppDataBase.initDataBase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      initialRoute: '/',
      getPages: AppRoutes.pages,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaleFactor: 1.0), // 屏蔽系统字体大小缩放
          child: child!,
        );
      },
    );
  }
}
