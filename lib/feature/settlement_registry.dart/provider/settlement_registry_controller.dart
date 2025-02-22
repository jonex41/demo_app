
import 'package:demo_app/component/loader.dart';
import 'package:demo_app/core/storage_service.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/home/provider/home_binding.dart';
import 'package:demo_app/network/network_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/router/locator.dart';
import '../../../core/router/router.dart';

class SettlementRegistryController extends GetxController {
  final networkService = Get.find<NetworkService>();
  final storageService = Get.find<StorageService>();
  var isInitialised = false.obs;
  var isPlaying = false.obs;
  var isFinished = false.obs;
  var otpString = ''.obs;
  var presentPhoneNumber = "";
  var currrentIndex = 0.obs;
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final resetPasswordController = TextEditingController();
  final resetConfirmPasswordController = TextEditingController();

  String pinId = '';

  @override
  void onInit() {
    isInitialised.value = true;

    super.onInit();
  }



  gotoHomeScreen(BuildContext c) {
    FocusScope.of(c).requestFocus(FocusNode());
    HomeBindings().dependencies();
    appRoute.replaceAll([const DashboardRoute()]);
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

}
