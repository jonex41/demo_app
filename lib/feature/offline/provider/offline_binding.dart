import 'package:demo_app/feature/login/provider/login_controller.dart';
import 'package:demo_app/feature/offline/provider/offline_controller.dart';
import 'package:get/get.dart';

class OfflineBindings extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<OfflineController>(() => OfflineController());
  }
}
