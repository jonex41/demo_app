import 'package:demo_app/feature/login/provider/login_controller.dart';
import 'package:demo_app/feature/wallet/provider/wallet_controller.dart';
import 'package:get/get.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<WalletController>(() => WalletController());
  }
}
