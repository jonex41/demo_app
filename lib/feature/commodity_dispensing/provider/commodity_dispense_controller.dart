import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:get/get.dart';

class CommodityDispenseController extends GetxController {
  Future<void> gotoCommDispenseDashboardScreen() async {
    appRoute.push(const CommDispenseDashboardRoute());
  }

  Future<void> gotoCommDispenseSavedFormsScreen() async {
    appRoute.push(const CommDispenseSavedFormsRoute());
  }

  Future<void> gotoCommDispenseSavedFormsDetailScreen() async {
    appRoute.push(const CommDispenseSavedFormsDetailRoute());
  }

  Future<void> gotoCommDispenseAddEditFormScreen() async {
    appRoute.push(const CommDispenseAddEditFormRoute());
  }

  Future<void> gotoCommDispenseViewSavedFormScreen() async {
    appRoute.push(const CommDispenseViewSavedFormRoute());
  }
}
