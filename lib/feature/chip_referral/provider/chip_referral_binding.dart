

import 'package:demo_app/feature/chip_referral/provider/chip_referral_controller.dart';
import 'package:demo_app/feature/house_hold_reg/provider/house_hold_reg_controller.dart';
import 'package:get/get.dart';

class ChipReferralBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ChipReferralController>(() => ChipReferralController());
  }
}
