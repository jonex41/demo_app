import 'package:demo_app/core/storage_service.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/home/provider/home_binding.dart';
import 'package:demo_app/network/network_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:progress_bar_steppers/stepper_data.dart';

import '../../../core/router/locator.dart';
import '../../../core/router/router.dart';

class EncouterRegMatController extends GetxController {
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

  final careGiversNameController = TextEditingController();
  final careGiversContactController = TextEditingController();
  final childsNameController = TextEditingController();
  final ageInMonthsController = TextEditingController();
  final settlementController = TextEditingController();
  final houseNoController = TextEditingController();
  final houseHoldNoController = TextEditingController();

  final formKeyNewBornScreen1 = GlobalKey<FormState>();
  final formKeyNewBornScreen2 = GlobalKey<FormState>();
  final formKeyNewBornScreen3 = GlobalKey<FormState>();
  final formKeyNewBornScreen4 = GlobalKey<FormState>();
  final formKeyNewBornScreen5 = GlobalKey<FormState>();

  final selectedSex = Rxn<String>();
  final List<String> sex = [
    'Male',
    'Female',
  ].obs;

  final selectedChildFullyImmunized = Rxn<String>();
  final List<String> optionYesNo = [
    'Yes',
    'No',
  ].obs;

  final selectedTypeOfVisit = Rxn<String>();
  final List<String> typeOfVisit = [
    'Routine',
    'Follow-up',
    'Emergency',
  ].obs;

  final Rxn<DateTime> _dateOfBirth = Rxn<DateTime>();

  DateTime? get dateOfBirth => _dateOfBirth.value;

  final Rxn<String> _selectDateOfBirth = Rxn<String>();

  String? get selectDateOfBirth => _selectDateOfBirth.value;

  final Rxn<DateTime> _dateOfVisit = Rxn<DateTime>();

  DateTime? get dateOfVisit => _dateOfVisit.value;

  final Rxn<String> _selectDateOfVisit = Rxn<String>();

  String? get selectDateOfVisit => _selectDateOfVisit.value;

  String pinId = '';

  List<StepperData> stepsData = [
    StepperData(
      label: '',
    ),
    StepperData(
      label: '',
    ),
    StepperData(
      label: '',
    ),
    StepperData(
      label: '',
    ),
    StepperData(
      label: '',
    ),
  ];
  final currentScreen = 1.obs;

  setSelectedDateOfBirth(String? value) {
    _selectDateOfBirth.value = value;
  }

  setDateOfBirth(DateTime? value) {
    _dateOfBirth.value = value;
  }

  setSelectedDateOfVisit(String? value) {
    _selectDateOfVisit.value = value;
  }

  setDateOfVisit(DateTime? value) {
    _dateOfVisit.value = value;
  }

  String title() {
    if (currentScreen.value == 1) {
      return 'Child & Caregiver Details';
    } else if (currentScreen.value == 2) {
      return 'Immunization Status';
    } else if (currentScreen.value == 3) {
      return 'Growth Monitoring & Nutrition';
    } else if (currentScreen.value == 4) {
      return 'Child Health Services & Follow-Up';
    } else if (currentScreen.value == 5) {
      return 'Referral & Pre-Referral Treatment';
    }
    return 'Child & Caregiver Details';
  }

  var atBirthVaccines = {
    "BCG": false,
    "OPV 0": false,
    "Hepatitis B": false,
  }.obs;

  var sixWeeksVaccines = {
    "OPV 1": false,
    "Rotavirus 1": false,
    "PCV 1": false,
    "Pentavalent 1": false,
  }.obs;

  var tenWeeksVaccines = {
    "OPV 2": false,
    "Penta 2": false,
    "PCV 2": false,
    "Rotavirus 2": false,
  }.obs;

  var fourteenWeeksVaccines = {
    "OPV 3": false,
    "Pentavalent 3": false,
    "PCV 3": false,
    "IPV (Inactivated Polio Vaccine)": false,
  }.obs;

  var nineMonthsVaccines = {
    "Measles 1st Dose": false,
    "Meningitis": false,
    "Yellow Fever Vaccine": false,
  }.obs;

  var fifteenMonthsVaccines = {
    "Measles 2nd Dose": false,
  }.obs;

  void toggleSelection(String key, bool? value) {
    atBirthVaccines[key] = value ?? false;
    debugPrint(selectedVaccines.join(", "));
  }

  void toggleSelectionSixWeeks(String key, bool? value) {
    sixWeeksVaccines[key] = value ?? false;
    debugPrint(selected6WeekVaccines.join(", "));
  }

  void toggleSelectionTenWeeks(String key, bool? value) {
    tenWeeksVaccines[key] = value ?? false;
    debugPrint(selected10WeekVaccines.join(", "));
  }

  void toggleSelection14Weeks(String key, bool? value) {
    fourteenWeeksVaccines[key] = value ?? false;
    debugPrint(selected14WeekVaccines.join(", "));
  }

  void toggleSelection9Months(String key, bool? value) {
    nineMonthsVaccines[key] = value ?? false;
    debugPrint(selected9MonthsVaccines.join(", "));
  }

  void toggleSelection15Months(String key, bool? value) {
    fifteenMonthsVaccines[key] = value ?? false;
    debugPrint(selected15MonthsVaccines.join(", "));
  }

  List<String> get selectedVaccines =>
      atBirthVaccines.entries.where((e) => e.value).map((e) => e.key).toList();

  List<String> get selected6WeekVaccines =>
      sixWeeksVaccines.entries.where((e) => e.value).map((e) => e.key).toList();

  List<String> get selected10WeekVaccines =>
      tenWeeksVaccines.entries.where((e) => e.value).map((e) => e.key).toList();

  List<String> get selected14WeekVaccines =>
      fourteenWeeksVaccines.entries.where((e) => e.value).map((e) => e.key).toList();

  List<String> get selected9MonthsVaccines =>
      nineMonthsVaccines.entries.where((e) => e.value).map((e) => e.key).toList();

  List<String> get selected15MonthsVaccines =>
      fifteenMonthsVaccines.entries.where((e) => e.value).map((e) => e.key).toList();

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
    appRoute.replaceAll([const HomeRoute()]);
  }

/*
  void loginNetwork(BuildContext context) async {
    final isValidForm = loginFormKey.currentState?.validate() ?? false;
    if (!isValidForm) return;
    try {
      String phoneNumber = getPhoneNumber(emailController.text.trim());
      showLoaderNew(context);
      final authResponse = await networkService.loginUser(
          {"phone": phoneNumber, "password": passwordController.text.trim()});

      if (authResponse != null) {
        if (authResponse.others!.verified == 1) {
          storageService.saveHasLogin(true);

          gotoHomeScreen(context);
        } else {
          showErrorSnackbar(context,
              'Please wait for verification, the account is not verified yet!');
        }
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
 */
  showErrorSnackbar(
    BuildContext context,
    String title,
  ) {
    snackBar(context,
        title: title, backgroundColor: AppPalette.red.red350, textColor: AppPalette.white);
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
    phoneNumber = phoneNumber.contains('+') ? phoneNumber.substring(1) : phoneNumber;
    phoneNumber = phoneNumber.contains('234') ? phoneNumber : '234${phoneNumber.substring(1)}';
    //presentPhoneNumber = phoneNumber;
    return phoneNumber;
  }
}
