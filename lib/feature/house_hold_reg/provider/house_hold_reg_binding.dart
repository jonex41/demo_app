

import 'package:demo_app/feature/house_hold_reg/provider/house_hold_reg_controller.dart';
import 'package:get/get.dart';

class HouseHoldRegBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<HouseHoldRegController>(() => HouseHoldRegController());
  }
}
