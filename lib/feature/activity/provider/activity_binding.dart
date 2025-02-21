import 'package:demo_app/feature/activity/provider/actiivity_controller.dart';
import 'package:demo_app/feature/login/provider/login_controller.dart';
import 'package:get/get.dart';

class ActivityBindings extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ActivityController>(() => ActivityController());
  }
}
