import 'package:example/data/local/preference/preference_manager.dart';
import 'package:example/data/local/preference/preference_manager_impl.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // 這裡存放需要在整個應用生命週期存在的Service Controller

    Get.lazyPut<PreferenceManager>(
      () => PreferenceManagerImpl(),
      tag: (PreferenceManager).toString(),
      fenix: true,
    );
  }
}
