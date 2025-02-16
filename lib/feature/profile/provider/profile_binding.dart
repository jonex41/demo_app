import 'package:demo_app/feature/login/provider/login_controller.dart';
import 'package:demo_app/feature/profile/provider/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
