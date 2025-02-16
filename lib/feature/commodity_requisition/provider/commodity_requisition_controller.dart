import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:get/get.dart';

class CommodityRequisitionController extends GetxController {
  Future<void> gotoCommRequisitionDashboardScreen() async {
    appRoute.push(const CommRequisitionDashboardRoute());
  }
}
