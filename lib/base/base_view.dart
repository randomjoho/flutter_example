import 'package:example/base/base_controller.dart';
import 'package:example/base/page_state.dart';
import 'package:example/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  const BaseView({super.key});

  Color? getPageBackgroundColor() {
    return null;
  }

  Color? getStatusBarColor() {
    return null;
  }

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        annotatedRegion(context),
        Obx(() => controller.pageState == PageState.LOADING
            ? _showLoading()
            : Container()),
        Obx(() => controller.errorMessage.isNotEmpty
            ? showErrorWidget(controller.errorMessage)
            : const SizedBox.shrink()),
      ],
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: getStatusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: getPageBackgroundColor(),
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: body(context),
    );
  }

  Widget showErrorWidget(String message) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            IconButton(
              onPressed: () => controller.retry(),
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
      ),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget _showLoading() {
    return const Loading();
  }
}
