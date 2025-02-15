import 'package:demo_app/feature/checklist/provider/checklist_controller.dart';
import 'package:get/get.dart';

class ChecklistBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChecklistController>(() => ChecklistController());
  }
}
