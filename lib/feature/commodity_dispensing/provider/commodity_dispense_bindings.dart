import 'package:demo_app/feature/commodity_dispensing/provider/commodity_dispense_controller.dart';
import 'package:get/get.dart';

class CommodityDispenseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommodityDispenseController>(
        () => CommodityDispenseController());
  }
}
