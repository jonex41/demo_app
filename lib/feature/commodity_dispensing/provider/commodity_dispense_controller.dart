import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:get/get.dart';

class CommodityDispenseController extends GetxController {
  Future<void> gotoCommDispenseDashboardScreen() async {
    appRoute.push(const CommDispenseDashboardRoute());
  }
}
