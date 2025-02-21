import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/home/provider/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/router/locator.dart';
import '../../../core/router/router.dart';

class ActivityController extends GetxController {
  final formKeyEditProfile = GlobalKey<FormState>();

  final selectedGender = Rxn<String>();
  final List<String> gender = ['male', 'female'].obs;

  final Rxn<DateTime> _dateOfBirth = Rxn<DateTime>();
  final searchTextController = TextEditingController();

  setDateOfBirth(DateTime? value) {
    _dateOfBirth.value = value;
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

  Future<void> gotoEditProfileScreen() async {
    appRoute.push(const EditProfileRoute());
  }
}
