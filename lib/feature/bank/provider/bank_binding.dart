import 'package:demo_app/feature/bank/provider/bank_controller.dart';

import 'package:get/get.dart';

class BankBindings extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<BankController>(() => BankController());
  }
}
