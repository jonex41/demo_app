
import 'package:demo_app/feature/encounter_reg_house/provider/encouter_reg_house_controller.dart';
import 'package:get/get.dart';

class EncouterRegHouseBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<EncouterRegHouseController>(() => EncouterRegHouseController());
  }
}
