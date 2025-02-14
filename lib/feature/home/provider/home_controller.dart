
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


import 'package:get/get.dart' hide ContextExtensionss;

import 'package:nb_utils/nb_utils.dart';

import 'package:demo_app/core/storage_service.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';


import 'package:demo_app/model/home/user_transaction_model.dart';


import 'package:demo_app/network/network_client.dart';

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
 // final scanModel = Rxn<ScanModel?>();
  final mytext = ''.obs;
  final textCOntroller = TextEditingController();
 
  final networkService = Get.find<NetworkService>();
  final storageService = Get.find<StorageService>();
  final FocusNode unitCodeCtrlFocusNode = FocusNode();

  @override
  void onInit() {
    // TODO: implement onInit
//   userModel.value = storageService.getUser();
    
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
}
