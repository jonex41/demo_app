import 'package:get/get.dart';
import 'package:demo_app/feature/home/provider/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
