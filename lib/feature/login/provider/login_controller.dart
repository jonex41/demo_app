import 'package:demo_app/component/loader.dart';
import 'package:demo_app/core/storage_service.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/home/provider/home_binding.dart';
import 'package:demo_app/model/login/login_res.dart';
import 'package:demo_app/network/network_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/router/locator.dart';
import '../../../core/router/router.dart';

class LoginController extends GetxController {
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
  final loginModel = Rxn<LoginResponse?>();

  String pinId = '';

  @override
  void onInit() {
    isInitialised.value = true;

    super.onInit();
  }

  @override
  void onClose() {
    //emailController.dispose();
    //passwordController.dispose();
    super.onClose();
  }

  gotoHomeScreen(BuildContext c) {
    FocusScope.of(c).requestFocus(FocusNode());
    HomeBindings().dependencies();
    appRoute.replaceAll([const DashboardRoute()]);
  }

  void loginNetwork(BuildContext context) async {
    final isValidForm = loginFormKey.currentState?.validate() ?? false;
    if (!isValidForm) return;
    try {
      showLoaderNew(context);
      final authResponse = await networkService.loginUser({
        "userId": emailController.text.trim(),
        "password": passwordController.text.trim()
      });

      if (authResponse != null) {
        loginModel.value = authResponse;
        storageService.saveHasLogin(true);

        gotoHomeScreen(context);
      } else {
        showErrorSnackbar(context, 'An error occurred');
      }
      hideLoaderNew();
    } on DioException catch (e) {
      hideLoaderNew();
      // errorSnackBar(title: e.toString());
      showErrorSnackbar(context, e.response!.data['message']);
      /*  if (e.toString().contains('404')) {
      } else if (e.toString().contains('400')) {
        showErrorSnackbar(context, 'Wrong Credentials');
      } else {
        showErrorSnackbar(context, e.toString());
      } */
    }
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

/*   void sendOtpForPasswordReset(BuildContext context) async {
    if (phoneController.text.trim().isEmptyOrNull) {
      snackBar(context,
          title: 'please make sure you enter your phone number',
          backgroundColor: AppPalette.red.red350,
          textColor: AppPalette.white);
      return;
    }
    showLoaderNew(context);
    try {
      String phoneNumber = getPhoneNumber(phoneController.text.trim());
      presentPhoneNumber = phoneNumber;
      final response = await networkService
          .passwordResetSendOtp({"mobile_number": phoneNumber});
      if (response.status == 200) {
        currrentIndex.value = 1;
        pinId = response.pinId!;
      }
      emailController.text = phoneController.text.trim();
      hideLoaderNew();
    } on DioException catch (e) {
      hideLoaderNew();
      // errorSnackBar(title: e.toString());
      //  showErrorSnackbar(context,);
      snackBar(context,
          title: e.response!.data['message'],
          backgroundColor: AppPalette.red.red350,
          textColor: AppPalette.white);
    }
  }

  void confirmOtpForPasswordReset(BuildContext context) async {
    if (phoneController.text.trim().isEmptyOrNull) {
      snackBar(context,
          title: 'please make sure you enter your phone number',
          backgroundColor: AppPalette.red.red350,
          textColor: AppPalette.white);
      return;
    }
    showLoaderNew(context);
    try {
      String phoneNumber = getPhoneNumber(phoneController.text.trim());
      presentPhoneNumber = phoneNumber;
      final response = await networkService.confirmpasswordResetSendOtp(
          {"pinId": pinId, "otp": otpString.value});
      if (response) {
        currrentIndex.value = 2;
      }
      hideLoaderNew();
    } on DioException catch (e) {
      hideLoaderNew();

      snackBar(context,
          title: e.response!.data['message'],
          backgroundColor: AppPalette.red.red350,
          textColor: AppPalette.white);
    }
  }

  void sendNewPassword(BuildContext context) async {
    if (resetConfirmPasswordController.text.trim().isEmptyOrNull ||
        resetPasswordController.text.trim().isEmptyOrNull ||
        (resetConfirmPasswordController.text.trim().isEmptyOrNull !=
            resetPasswordController.text.trim().isEmptyOrNull)) {
      snackBar(context,
          title:
              'please make sure you enter your phone number, and the two matches',
          backgroundColor: AppPalette.red.red350,
          textColor: AppPalette.white);
      return;
    }
    showLoaderNew(context);
    try {
      final response =
          await networkService.resetTheMeanPassword(presentPhoneNumber, {
        "password": getPhoneNumber(resetConfirmPasswordController.text.trim()),
      });
      if (response) {
        appRoute.replaceAll([const LoginRoute()]);
      }
      hideLoaderNew();
    } on DioException catch (e) {
      hideLoaderNew();

      snackBar(context,
          title: e.response!.data['message'],
          backgroundColor: AppPalette.red.red350,
          textColor: AppPalette.white);
    }
  }
 */
  String getPhoneNumber(String value) {
    String phoneNumber = value;
    phoneNumber =
        phoneNumber.contains('+') ? phoneNumber.substring(1) : phoneNumber;
    phoneNumber = phoneNumber.contains('234')
        ? phoneNumber
        : '234${phoneNumber.substring(1)}';
    //presentPhoneNumber = phoneNumber;
    return phoneNumber;
  }
}
