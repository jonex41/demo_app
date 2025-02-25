import 'package:demo_app/core/storage_service.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/home/provider/home_binding.dart';
import 'package:demo_app/model/home/activity_model.dart';
import 'package:demo_app/network/network_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/router/locator.dart';
import '../../../core/router/router.dart';

class ActivityController extends GetxController {
  final formKeyEditProfile = GlobalKey<FormState>();
  final networkService = Get.find<NetworkService>();
  final storageService = Get.find<StorageService>();
  final recentSubmissions = 0.obs;
  final totalPregnantWomen = 0.obs;
  final households = 0.obs;
  final selectedGender = Rxn<String>();
  final List<String> gender = ['male', 'female'].obs;

  final model = Rxn<ActivityModel>();
  final searchTextController = TextEditingController();
/* 
 "recentSubmissions": 37,
    "totalPregnantWomen": 34,
    "households": 7
 */
/*   setDateOfBirth(DateTime? value) {
    _dateOfBirth.value = value;
  } */
  @override
  void onInit() {
    getDataOnline();
    super.onInit();
  }

  gotoHomeScreen(BuildContext c) {
    FocusScope.of(c).requestFocus(FocusNode());
    HomeBindings().dependencies();
    appRoute.replaceAll([const HomeRoute()]);
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
    model.value = await networkService.getAnalytics();

    /*
    listMapCopy.addAll(listMap); */
  }

  Future<void> gotoEditProfileScreen() async {
    appRoute.push(const EditProfileRoute());
  }
}
