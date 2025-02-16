
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:get/get.dart';

class EncouterRegMatBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<EncouterRegMatController>(() => EncouterRegMatController());
  }
}
