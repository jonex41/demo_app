import 'package:demo_app/feature/commodity_requisition/provider/commodity_requisition_controller.dart';
import 'package:get/get.dart';

class CommodityRequisitionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommodityRequisitionController>(
        () => CommodityRequisitionController());
  }
}
