import 'package:demo_app/feature/login/provider/login_controller.dart';
import 'package:demo_app/feature/settlement_registry.dart/provider/settlement_registry_controller.dart';
import 'package:get/get.dart';

class SettlementRegistryBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<SettlementRegistryController>(() => SettlementRegistryController());
  }
}
