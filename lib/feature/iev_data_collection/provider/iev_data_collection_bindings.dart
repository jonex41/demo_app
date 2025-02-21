import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_controller.dart';
import 'package:get/get.dart';

class IEVDataCollectionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IEVDataCollectionController>(() => IEVDataCollectionController());
  }
}
