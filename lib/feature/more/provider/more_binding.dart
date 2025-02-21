import 'package:demo_app/feature/login/provider/login_controller.dart';
import 'package:demo_app/feature/more/provider/more_controller.dart';
import 'package:get/get.dart';

class MoreBindings extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<MoreController>(() => MoreController());
  }
}
