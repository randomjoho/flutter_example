import 'package:example/routes/routes.dart';
import 'package:example/routes/src/home_route.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              AppRoutes.toNamed(HomeRoutes.home);
            },
            child: const Text(
              '跳转-> Home',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ],
      ),
    ));
  }
}
