import 'package:demo_app/core/offline_storage.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/storage_service.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/checklist/provider/checklist_bindings.dart';
import 'package:demo_app/feature/commodity_dispensing/provider/commodity_dispense_bindings.dart';
import 'package:demo_app/feature/commodity_requisition/provider/commodity_requisition_bindings.dart';
import 'package:demo_app/feature/iev_data_collection/provider/iev_data_collection_bindings.dart';
import 'package:demo_app/feature/login/provider/login_controller.dart';
import 'package:demo_app/feature/settlement_registry.dart/provider/settlement_registry_binding.dart';
import 'package:demo_app/model/home/user_transaction_model.dart';
import 'package:demo_app/model/login/login_res.dart';
import 'package:demo_app/network/network_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:nb_utils/nb_utils.dart';

class HomeController extends GetxController {
  final isFirst = true.obs;
  final canShowTransaction = false.obs;
  final canShowSend = false.obs;
  final canShowMore = false.obs;
  final showBalance = true.obs;
  final userTransactions = <TransactionModel?>[].obs;
  final userTransactions4 = <TransactionModel?>[].obs;
  final text = ''.obs;
  final selectedTab = 0.obs;
  final pendingSync = 0.obs;
  final submittedList = 0.obs;
  // final scanModel = Rxn<ScanModel?>();
  final mytext = ''.obs;
  final textCOntroller = TextEditingController();

  final networkService = Get.find<NetworkService>();
  final storageService = Get.find<StorageService>();
  final FocusNode unitCodeCtrlFocusNode = FocusNode();

  final loginModel = Rxn<LoginResponse?>();
  @override
  void onInit() {
    // TODO: implement onInit
//   userModel.value = storageService.getUser();
    loginModel.value = storageService.getUser();
    getLocal();
    getDataOnline();
    selectedTab.listen((value) {
      print('new $value');
    });
    super.onInit();
  }

  showSuccessSnackbar(
    BuildContext context,
    String title,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppPalette.green,
      content: Text(
        title,
        style: const TextStyle(color: AppPalette.white),
      ),
      duration: const Duration(milliseconds: 300),
    ));
  }

  showErrorSnackbar(
    BuildContext context,
    String title,
  ) {
    snackBar(context,
        title: title,
        backgroundColor: AppPalette.red.red350,
        textColor: AppPalette.white);
  }

  void getDataOnline() async {
    var map = await networkService.getAllIEVData(1);
    print("online data $map");

    submittedList.value = convertList(map).length;

    /*
    listMapCopy.addAll(listMap); */
  }

  List<Map<String, dynamic>> convertList(List<dynamic> data) {
    return List<Map<String, dynamic>>.from(
        data.map((item) => Map<String, dynamic>.from(item)));
  }

  void getLocal() async {
    final storageService = LocalStorageService(key: "my_storage_key");
    var list = await storageService.getList();
    pendingSync.value = list.length;
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  Future<void> gotoChecklistHomeScreen() async {
    ChecklistBindings().dependencies();
    appRoute.push(const ChecklistHomeRoute());
  }

  Future<void> gotoSettlementRegistryScreen() async {
    SettlementRegistryBinding().dependencies();
    appRoute.push(const SettlementRegistryRoute());
  }

  Future<void> gotoCommDispenseHomeScreen() async {
    CommodityDispenseBindings().dependencies();
    appRoute.push(const CommDispenseHomeRoute());
  }

  Future<void> gotoCommRequisitionHomeScreen() async {
    CommodityRequisitionBindings().dependencies();
    appRoute.push(const CommRequisitionHomeRoute());
  }

  Future<void> gotoIEVDataHomeScreen() async {
    IEVDataCollectionBindings().dependencies();
    appRoute.push(const IEVDataHomeRoute());
  }
}
