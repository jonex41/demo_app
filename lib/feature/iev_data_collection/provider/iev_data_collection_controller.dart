import 'dart:developer';

import 'package:demo_app/core/offline_storage.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/home/provider/home_controller.dart';
import 'package:demo_app/feature/iev_data_collection/modal/success_modal.dart';
import 'package:demo_app/feature/login/provider/login_controller.dart';
import 'package:demo_app/feature/offline/provider/offline_controller.dart';
import 'package:demo_app/feature/util/my_list_settlement.dart';
import 'package:demo_app/feature/util/nigerian_states_and_lga.dart';
import 'package:demo_app/feature/util/utils.dart';
import 'package:demo_app/model/home/activity_model.dart';
import 'package:demo_app/network/network_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // Import compute()
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_bar_steppers/stepper_data.dart';
import 'package:uuid/uuid.dart';

class IEVDataCollectionController extends GetxController {
  var isEditing = false.obs;
  var isFirstTime = false.obs;
  Map<String, dynamic> selectedMap = {};

  var textFieldCountMothersInTheHouseHold = 0.obs;
  var mothersNameControllerLoop = <TextEditingController>[].obs;
  var mothersPhoneNumberControllerLoop = <TextEditingController>[].obs;
  var timesTheWomanVisitedHealthFacilityControllerLoop =
      <TextEditingController>[].obs;
  var nameHealthCareFacilityWomanReceivesAntenatalCareControllerMotherLoop =
      <TextEditingController>[].obs;
  var selectedIsMotherPregnantLoop = <RxString>[].obs;
  var selectedMonthsPregnantMotherLoop = <RxString>[].obs;
  var selectedDosesTDVaccineTakenMotherLoop = <RxString>[].obs;
  var selectedHasPregnantWomanStartedAncLoop = <RxString>[].obs;

  void updateFields(int count) {
    textFieldCountMothersInTheHouseHold.value = count;
    mothersNameControllerLoop.clear();
    mothersPhoneNumberControllerLoop.clear();
    timesTheWomanVisitedHealthFacilityControllerLoop.clear();
    selectedIsMotherPregnantLoop.clear();
    selectedMonthsPregnantMotherLoop.clear();
    selectedDosesTDVaccineTakenMotherLoop.clear();
    selectedHasPregnantWomanStartedAncLoop.clear();
    nameHealthCareFacilityWomanReceivesAntenatalCareControllerMotherLoop
        .clear();
    for (int i = 0; i < count; i++) {
      mothersNameControllerLoop.add(TextEditingController());
      mothersPhoneNumberControllerLoop.add(TextEditingController());
      timesTheWomanVisitedHealthFacilityControllerLoop
          .add(TextEditingController());
      selectedIsMotherPregnantLoop.add('No'.obs);
      selectedMonthsPregnantMotherLoop.add('None'.obs);
      selectedDosesTDVaccineTakenMotherLoop.add('None'.obs);
      selectedHasPregnantWomanStartedAncLoop.add('No'.obs);
      nameHealthCareFacilityWomanReceivesAntenatalCareControllerMotherLoop
          .add(TextEditingController());
      //selectedIsMotherPregnant.add("".obs);
    }
  }

  void updateEditFields(int count, List<Map<String, dynamic>> myList) {
    textFieldCountMothersInTheHouseHold.value = count;
    print("leitoop $myList");
    for (var model in myList) {
      mothersNameControllerLoop
          .add(TextEditingController(text: model["name"].toString()));
      mothersPhoneNumberControllerLoop
          .add(TextEditingController(text: model["phoneNumber"].toString()));
      timesTheWomanVisitedHealthFacilityControllerLoop
          .add(TextEditingController(text: model["ancVisits"].toString()));
      selectedIsMotherPregnantLoop
          .add(model["isPregnant"].toString() == "true" ? "Yes".obs : "No".obs);
      selectedMonthsPregnantMotherLoop
          .add(model["monthsPregnant"].toString().obs);
      selectedDosesTDVaccineTakenMotherLoop
          .add(model["ttTdDoses"].toString().obs);

      String myValue = model["hasPregnantWomanStartedAnc"].toString() == "null"
          ? "No"
          : model["hasPregnantWomanStartedAnc"].toString();
      selectedHasPregnantWomanStartedAncLoop.add(myValue.obs);
      nameHealthCareFacilityWomanReceivesAntenatalCareControllerMotherLoop.add(
          TextEditingController(
              text: model["nameOfHealthcareFacilityForAnc"].toString()));
      //selectedIsMotherPregnant.add("".obs);
    }
  }

  var textFieldCountNumberOfUnder5Children = 0.obs;
  var nameofChildControllerLoop = <TextEditingController>[].obs;
  final List<Rxn<String>> selectedGenderLoop = [];
  final List<Rxn<String>> selectedHaveRiVaccinationCardLoop = [];
  var howManyVisitChildHadToHealthFacilityLoop = <TextEditingController>[].obs;
  var siteOfLastVaccineLoop = <TextEditingController>[].obs;
  var nameOfHFChildGoesForVaccinationLoop = <TextEditingController>[].obs;
  final List<Rxn<String>> selectedKnowDateOfBirthLoop = [];
  var selectedDatesLoop = <Rx<DateTime?>>[].obs; // List to store selected dates
  final List<Rxn<String>> selectedChildAgeDaysLoop = [];
  final List<Rxn<String>> selectedChildAgeMonthsLoop = [];
  final List<Rxn<String>> selectedChildAgeYearsLoop = [];
  final List<Rxn<String>> selectedChildEverReceivedPolioVaccineInPastLoop = [];
  final List<Rxn<String>> selectedChildEverReceivedRoutineVaccinesInPastLoop =
      [];
  var selectedAntigensLoop =
      <RxList<String>>[].obs; // List to store multiple selections
  var nameOfPrimaryCareGiverOfChildLoop = <TextEditingController>[].obs;
  final List<Rxn<String>> selectedRelationShipOfPrimaryCareGiverOfChildLoop =
      [];
  var phoneNumberOfPrimaryCareGiverOfChildLoop = <TextEditingController>[].obs;

  void updateFieldsCountNumberOfUnder5Children(int count) {
    textFieldCountNumberOfUnder5Children.value = count;
    nameofChildControllerLoop.clear();
    selectedGenderLoop.clear();
    selectedHaveRiVaccinationCardLoop.clear();
    vaccineSelections.clear();
    selectedAges.clear();
    howManyVisitChildHadToHealthFacilityLoop.clear();
    siteOfLastVaccineLoop.clear();
    nameOfHFChildGoesForVaccinationLoop.clear();
    selectedKnowDateOfBirthLoop.clear();
    selectedDatesLoop.clear();
    selectedChildAgeDaysLoop.clear();
    selectedChildAgeMonthsLoop.clear();
    selectedChildAgeYearsLoop.clear();
    selectedChildEverReceivedPolioVaccineInPastLoop.clear();
    selectedChildEverReceivedRoutineVaccinesInPastLoop.clear();
    selectedAntigensLoop.clear();
    nameOfPrimaryCareGiverOfChildLoop.clear();
    selectedRelationShipOfPrimaryCareGiverOfChildLoop.clear();
    phoneNumberOfPrimaryCareGiverOfChildLoop.clear();

    for (int i = 0; i < count; i++) {
      nameofChildControllerLoop.add(TextEditingController());
      selectedGenderLoop.add(Rxn<String>());
      selectedHaveRiVaccinationCardLoop.add(Rxn<String>());
      selectedKnowDateOfBirthLoop.add(Rxn<String>());
      vaccineSelections[i] = RxMap<String, bool>();
      selectedAges[i] = "";
      howManyVisitChildHadToHealthFacilityLoop.add(TextEditingController());
      siteOfLastVaccineLoop.add(TextEditingController());
      nameOfHFChildGoesForVaccinationLoop.add(TextEditingController());
      selectedDatesLoop.add(Rx<DateTime?>(null)); // Initialize with null
      selectedChildAgeDaysLoop.add(Rxn<String>());
      selectedChildAgeMonthsLoop.add(Rxn<String>());
      selectedChildAgeYearsLoop.add(Rxn<String>());
      selectedChildEverReceivedPolioVaccineInPastLoop.add(Rxn<String>());
      selectedChildEverReceivedRoutineVaccinesInPastLoop.add(Rxn<String>());
      selectedAntigensLoop.add(<String>[].obs); // Initialize multi-select list
      nameOfPrimaryCareGiverOfChildLoop.add(TextEditingController());
      selectedRelationShipOfPrimaryCareGiverOfChildLoop.add(Rxn<String>());
      phoneNumberOfPrimaryCareGiverOfChildLoop.add(TextEditingController());
    }
  }

  // Opens a Date Picker and updates the selected date
  Future<void> pickDate(BuildContext context, int index) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      selectedDatesLoop[index].value = pickedDate;
    }
  }

  final List<String> careGiverRelationship = [
    "Mother",
    "Father",
    "Brother",
    "Sister",
    "Grandmother",
    "Grandfather",
    "Aunt",
    "Uncle",
    "Cousin",
    "Niece",
    "Nephew",
    "Foster Parent",
    "Adoptive Parent",
    "Legal Guardian",
    "Nanny/Babysitter",
    "Teacher",
    "Social Worker",
  ].obs;

  final List<String> selectAntigens = [
    "BCG",
    "OPV0",
    "HepB0 birth",
    "Pentavalent (DPT, Hep B and Hib)1",
    "PCV 1",
    "OPV1",
    "IPV1",
    "Rota virus vaccine 1",
    "Pentavalent (DPT, Hep B and Hib)2",
    "PCV 2",
    "OPV2",
    "Rota virus vaccine 2",
    "Pentavalent (DPT, Hep B and Hib)3",
    "PCV 3",
    "OPV3",
    "IPV2",
    "Rota virus vaccine 1",
    "Vitamin A 1st dose",
    "Measles 1st dose",
    "Yellow Fever",
    "Vitamin A 2nd dose",
    "Measles 2nd dose",
  ].obs;

  var childAgeDays = [
    "1-day",
    "2-days",
    "3-days",
    "4-days",
    "5-days",
    "6-days",
    "1-week",
    "2-weeks",
    "3-weeks",
  ].obs;
  var childAgeMonths = [
    "1-month",
    "2-months",
    "3-months",
    "4-months",
    "5-months",
    "6-months",
    "7-months",
    "8-months",
    "9-months",
    "10-months",
    "11-months",
  ].obs;
  var childAgeYears = [
    "1-year",
    "1-year-1-month",
    "1-year-2-months",
    "1-year-3-months",
    "1-year-4-months",
    "1-year-5-months",
    "1-year-6-months",
    "1-year-7-months",
    "1-year-8-months",
    "1-year-9-months",
    "1-year-10-months",
    "1-year-11-months",
    "2-years",
    "2-years-3-months",
    "2-years-6-months",
    "2-years-9-months",
    "3-years",
    "3-years-3-months",
    "3-years-6-months",
    "3-years-9-months",
    "4-years",
    "4-years-3-months",
    "4-years-6-months",
    "4-years-9-months",
    "5-years"
  ].obs;

  final selectedKnowDateOfBirth = Rxn<String>();
  final List<String> knowDateOfBirth = [
    'Yes',
    'No',
  ].obs;

  final List<String> optionYesNo = [
    'Yes',
    'No',
  ].obs;

  void updateEditFieldsCountNumberOfUnder5Children(
      int count, List<Map<String, dynamic>> myList) {
    textFieldCountNumberOfUnder5Children.value = count;
    int i = 0;
    for (var model in myList) {
      nameofChildControllerLoop.add(TextEditingController(text: model["name"]));
      //selectedGenderLoop.add(model["gender"].toString().obs);
      String hasCard =
          model["hasVaccinationCard"].toString() == "true" ? "Yes" : "No";
      //selectedHaveRiVaccinationCardLoop.add(hasCard.obs);
      vaccineSelections[i] = RxMap<String, bool>();
      selectedAges[i] = model["age"];
      howManyVisitChildHadToHealthFacilityLoop.add(TextEditingController());
      siteOfLastVaccineLoop
          .add(TextEditingController(text: model["lastVaccinationSite"]));
      nameOfHFChildGoesForVaccinationLoop.add(TextEditingController(
          text: model["nameOfHealthcareFacilityForVaccination"]));
      i++;
    }
  }

  var vaccineSelections = <int, RxMap<String, bool>>{}.obs;
  var selectedAges = <int, String>{}.obs;

  final Map<String, List<String>> vaccineData = {
    "At birth": ["BCG", "OPV0", "HepB0 birth"],
    "6 weeks": [
      "Pentavalent (DPT, Hep B and Hib)1",
      "PCV 1",
      "OPV1",
      "IPV1",
      "Rota virus vaccine 1"
    ],
    "10 weeks": [
      "Pentavalent (DPT, Hep B and Hib)2",
      "PCV 2",
      "OPV2",
      "Rota virus vaccine 2"
    ],
    "14 weeks": [
      "Pentavalent (DPT, Hep B and Hib)3",
      "PCV 3",
      "OPV3",
      "IPV2",
      "Rota virus vaccine 1"
    ],
    "6 months": ["Vitamin A 1st dose"],
    "9 months": ["Measles 1st dose", "Yellow Fever"],
    "12 months": ["Vitamin A 2nd dose"],
    "15 months": ["Measles 2nd dose"],
  };

  void updateVaccineList(int index, String age) {
    selectedAges[index] = age;
    //vaccineSelections.clear();
    vaccineSelections[index] = RxMap.from(
      {for (var vaccine in vaccineData[age] ?? []) vaccine: false},
    );
    //vaccineSelections.refresh();
  }

  var textFieldCountOtherPregnantWomenInHouseHold = 0.obs;
  var fullNamePregnantWomanControllerLoop = <TextEditingController>[].obs;
  var selectedHowManyMonthsPregnantLoop = <RxString>[].obs;
  var selectedHasWomanTakenTTIDVaccineLoop = <RxString>[].obs;
  var selectedDosesTDVaccineTakenPregnantLoop = <RxString>[].obs;
  var howManyTimesTheWomanVisitedHealthFacilityControllerPregnantLoop =
      <TextEditingController>[].obs;
  var nameHealthCareFacilityWomanReceivesAntenatalCareControllerPregnantLoop =
      <TextEditingController>[].obs;
  final List<Rxn<String>> selectedHasWomanVisitedHealthFacilityForAncLoop = [];
  var phoneNumberOfPregnantWomanControllerLoop = <TextEditingController>[].obs;

  void updateFieldCountOtherPregnantWomenInHouseHold(int count) {
    textFieldCountOtherPregnantWomenInHouseHold.value = count;
    fullNamePregnantWomanControllerLoop.clear();
    selectedHowManyMonthsPregnantLoop.clear();
    selectedHasWomanTakenTTIDVaccineLoop.clear();
    selectedDosesTDVaccineTakenPregnantLoop.clear();
    howManyTimesTheWomanVisitedHealthFacilityControllerPregnantLoop.clear();
    nameHealthCareFacilityWomanReceivesAntenatalCareControllerPregnantLoop
        .clear();
    selectedHasWomanVisitedHealthFacilityForAncLoop.clear();
    phoneNumberOfPregnantWomanControllerLoop.clear();

    for (int i = 0; i < count; i++) {
      fullNamePregnantWomanControllerLoop.add(TextEditingController());
      selectedHowManyMonthsPregnantLoop.add('None'.obs);
      selectedHasWomanTakenTTIDVaccineLoop.add('No'.obs);
      selectedDosesTDVaccineTakenPregnantLoop.add('None'.obs);
      howManyTimesTheWomanVisitedHealthFacilityControllerPregnantLoop
          .add(TextEditingController());
      nameHealthCareFacilityWomanReceivesAntenatalCareControllerPregnantLoop
          .add(TextEditingController());
      selectedHasWomanVisitedHealthFacilityForAncLoop.add(Rxn<String>());
      phoneNumberOfPregnantWomanControllerLoop.add(TextEditingController());
    }
  }

  void updateEditFieldCountOtherPregnantWomenInHouseHold(
      int count, List<Map<String, dynamic>> myList) {
    textFieldCountOtherPregnantWomenInHouseHold.value = count;

    for (var model in myList) {
      fullNamePregnantWomanControllerLoop
          .add(TextEditingController(text: model["fullName"].toString()));
      selectedHowManyMonthsPregnantLoop
          .add(model["monthsPregnant"].toString().obs);
      selectedHasWomanTakenTTIDVaccineLoop
          .add(model["ttTdDoses"].toString() == "null" ? "No".obs : 'Yes'.obs);
      selectedDosesTDVaccineTakenPregnantLoop
          .add(model["ttTdDoses"].toString().obs);
      howManyTimesTheWomanVisitedHealthFacilityControllerPregnantLoop
          .add(TextEditingController(text: model["ancVisits"].toString()));
      nameHealthCareFacilityWomanReceivesAntenatalCareControllerPregnantLoop
          .add(TextEditingController(
              text: model["nameOfHealthcareFacilityForAnc"].toString()));
    }
  }

  var textFieldCountHowManyOtherWomenAreThereInHouseHold = 0.obs;
  final womenAreThereInHouseHoldAge15And49 = TextEditingController();
  var firstNameOtherWomenControllerLoop = <TextEditingController>[].obs;
  var surNameOtherWomenControllerLoop = <TextEditingController>[].obs;

  void updateFieldCountHowManyOtherWomenAreThereInHouseHold(int count) {
    textFieldCountHowManyOtherWomenAreThereInHouseHold.value = count;
    firstNameOtherWomenControllerLoop.clear();
    surNameOtherWomenControllerLoop.clear();

    for (int i = 0; i < count; i++) {
      firstNameOtherWomenControllerLoop.add(TextEditingController());
      surNameOtherWomenControllerLoop.add(TextEditingController());
    }
  }

  /// Extract selected age groups and their chosen vaccines in a map format.
  List<String> getSelectedAges() {
    return selectedAges.values.where((age) => age.isNotEmpty).toList();
  }

  /// Get selected vaccines separately
  List<String> getSelectedVaccines() {
    List<String> vaccines = [];
    vaccineSelections.forEach((index, selection) {
      vaccines.addAll(selection.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key));
    });
    return vaccines;
  }

  List<Map<String, dynamic>> getDetails(dynamic e) {
    return convertList(e);
  }

  List<Map<String, dynamic>> convertList(List<dynamic> data) {
    return List<Map<String, dynamic>>.from(
        data.map((item) => Map<String, dynamic>.from(item)));
  }

  final networkService = Get.find<NetworkService>();
  final Rxn<Position> currentPosition = Rxn<Position>();

  final howManyGirlsAged9AreInHousehold = TextEditingController();
  final othersProceedSpecify = TextEditingController();

  final loadingCoordinate = false.obs;
  final nameOfEnumerator = TextEditingController();
  final phoneNumber = TextEditingController();
  final teamCode = TextEditingController();
  final ward = TextEditingController();
  final houseNumber = TextEditingController();
  final houseHoldNumber = TextEditingController();

  final headOfHouseHoldName = TextEditingController();
  final headOfHousePhoneNumber = TextEditingController();
  final mothersName = TextEditingController();
  final mothersPhoneNumber = TextEditingController();

  final nameofChild = TextEditingController();
  final siteOfLastVaccine = TextEditingController();

  final numberOfPregnantWomen = TextEditingController();
  final firstname = TextEditingController();
  final surname = TextEditingController();

  final firstnameWoman = TextEditingController();
  final surnameWoman = TextEditingController();
  final numberOfAncVisitsToHealthFacility = TextEditingController();
  final numberOfAncVisitsToHealthFacilityMother = TextEditingController();
  final numberOfMothersInTheHouse = TextEditingController();
  final howManyVisitChildHadToHealthFacility = TextEditingController();
  final under5ChildrenMotherHave = TextEditingController();

  final stateValue = "Abia".obs;
  final lgaValue = Rxn<String>();
  final wardValue = Rxn<String>();
  final statesLga = Rxn<List<String>>([]);

  //List<String> listOfSettlementValue = [];

  final formKeyScreen1 = GlobalKey<FormState>();
  final formKeyScreen2 = GlobalKey<FormState>();

  final formKeyScreen3 = GlobalKey<FormState>();

  final formKeyScreen4 = GlobalKey<FormState>();

  final Rxn<DateTime> _dateOfBirth = Rxn<DateTime>();

  DateTime? get dateOfBirth => _dateOfBirth.value;

  final Rxn<String> _selectDateOfBirth = Rxn<String>();

  String? get selectDateOfBirth => _selectDateOfBirth.value;

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
  ];
  final currentScreen = 1.obs;

  final selectedProceed = Rxn<String>();
  final List<String> proceed = [
    'Yes',
    'No',
  ].obs;

  final selectedProceedReason = Rxn<String>();
  final List<String> proceedReason = [
    'Head of house absent',
    'Respondent is not comfortable',
    'Respondent refused',
    'Others specify'
  ].obs;

  final selectedSettlement = Rxn<String>();
  final List<String> settlement = [
    'Settlement 1',
    'Settlement 2',
    'Settlement 3',
    'Settlement 4',
    'Settlement 5',
  ].obs;

  final selectedAgeCategory = Rxn<String>();
  final List<String> ageCategory = [
    '0 - 5 Weeks',
    '6 - 9 Weeks',
    '10 - 13 Weeks',
    '14 Weeks - 4 Months ',
    '5 Months',
    '6 Months',
    '7 - 8 Months',
    '9 - 12 Months',
    '1 Year',
    '15 Months',
    '2 Years',
    '3 Years',
    '4 Years',
    '5 Years',
  ].obs;

  final selectedGender = Rxn<String>();
  final List<String> gender = [
    'Male',
    'Female',
  ].obs;

  final selectedHaveRiVaccinationCard = Rxn<String>();
  final List<String> riVaccinationCard = [
    'Yes',
    'No',
  ].obs;

  final selectedReceivedAntigens = [].obs;
  final List<String> selectReceivedAntigens = [
    'BCG',
    'Hepatitis B Birth Dose',
    'OPV 0',
    'Penta 1',
    'Penta 2',
    'Penta 3',
    'OPV 1',
    'OPV 2',
    'OPV 3',
    'IPV',
    'PCV 1',
    'PCV 2',
    'PCV 3',
    'Rota 1',
    'Rota 2',
    'Measles 1',
    'Measles 2',
    'Yellow Fever',
    'MenA',
    'HPV',
  ].obs;

  final selectedMonthsPregnant = Rxn<String>();
  final List<String> monthsPregnant = [
    'None',
    '1 month',
    '2 months',
    '3 months',
    '4 months',
    '5 months',
    '6 months',
    '7 months',
    '8 months',
    '9 months'
  ].obs;

  final selectedMonthsPregnantMother = Rxn<String>();
  final List<String> monthsPregnantMother = [
    'None',
    '1 month',
    '2 months',
    '3 months',
    '4 months',
    '5 months',
    '6 months',
    '7 months',
    '8 months',
    '9 months'
  ].obs;

  final selectedDosesTDVaccineTakenMother = Rxn<String>();
  final hasWomanTTIDVaccine = Rxn<String>();
  final List<String> dosesTDVaccineTakenMother = [
    'None',
    'TT1',
    'TT2',
    'TT3',
    'TT4',
    'TT5',
  ].obs;

  final selectedDosesTDVaccineTaken = Rxn<String>();
  final List<String> dosesTDVaccineTaken = [
    'None',
    'TT1',
    'TT2',
    'TT3',
    'TT4',
    'TT5',
  ].obs;

  final selectedOtherWomenInTheHousehold = Rxn<String>();
  final List<String> otherWomenInTheHousehold = [
    'Yes',
    'No',
  ].obs;

  final selectedIsMotherPregnant = Rxn<String>();
  final List<String> isMotherPregnant = [
    'Yes',
    'No',
  ].obs;

  @override
  void onInit() {
    getState();
    //getFileData();

    var model = Get.find<HomeController>().loginModel.value;
    nameOfEnumerator.text = "${model?.firstName} ${model?.lastName}";
    phoneNumber.text = model?.phone ?? "";

    Future.delayed(
        const Duration(
          seconds: 1,
        ), () {
      List<String> kklist = [
        "Select Lga",
        ...NigerianStatesAndLGA.getStateLGAs("Abia")
      ];

      //  kklist.insert(0, "Select Lga");
      lgaValue.value = kklist[0];
      listLga.value.assignAll(kklist ?? []);
    });
    super.onInit();
  }

  void getFileData() async {
    //listOfSettlementValue = await readListFromAssets();
    print("i am here 9");
  }

  Future<List<String>> readListFromAssets() async {
    try {
      // Load file content
      print("i am here 1");
      String fileContent = await rootBundle.loadString('assets/data.txt');
      print("i am here 2");
      // Split into a list by line breaks
      return compute(processFileContent, fileContent);
    } catch (e) {
      print("i am here 3");
      print("Error reading asset file: $e");
      return [];
    }
  }

  List<String> processFileContent(String content) {
    return content.split("\n").map((line) => line.trim()).toList();
  }

  final listState = <String>[].obs;
  final listWard = <String>[].obs;
  final listSettlement = <String>[].obs;
  final listSettlementModel = <SettlementModel>[];
  final listLga = <String>[].obs;

  String title() {
    if (currentScreen.value == 1) {
      return 'Enumerator Questionnaire for Immunization Status Survey';
    } else if (currentScreen.value == 2) {
      return 'Consent';
    } else if (currentScreen.value == 3) {
      return 'U5 Child Profile and Immunization Status';
    } else if (currentScreen.value == 4) {
      return 'Women of Childbearing Age (WCBA) Profile';
    }
    return 'Enumerator Questionnaire for Immunization Status Survey';
  }

  setSelectedDateOfBirth(String? value) {
    _selectDateOfBirth.value = value;
  }

  setDateOfBirth(DateTime? value) {
    _dateOfBirth.value = value;
  }

  void setNgState(String ngState) {
    stateValue.value = ngState;
    debugPrint(stateValue.value);
  }

  void setNgLGA(String ngLGA) {
    lgaValue.value = ngLGA;
    debugPrint(lgaValue.value);
  }

  Future<Map<String, dynamic>> newMapData() async {
    Map<String, dynamic> data = {
      "enumerator": {
        "name": nameOfEnumerator.text,
        "phoneNumber": phoneNumber.text,
        "teamCode": teamCode.text
      },
      "settlement": {
        "state": stateValue.value ?? '',
        "lga": lgaValue.value ?? '',
        "ward": wardValue.value ?? '',
        "settlement": selectedSettlement.value ?? ''
      },
      "household": {
        "houseNumber": houseNumber.text,
        "houseHoldNumber": houseHoldNumber.text,
        "consent": selectedProceed.value ?? '',
        "reasonForNonConsent": selectedProceedReason.value,
        "nameofHouseHoldHead": headOfHouseHoldName.text,
        "houseHoldHeadPhoneNumber": headOfHousePhoneNumber.text,
        "numberOfWomenAged15to49InHousehold":
            int.tryParse(womenAreThereInHouseHoldAge15And49.text) ?? 0,
        "numberOfPregnantWomenInHousehold":
            int.tryParse(numberOfPregnantWomen.text) ?? 0,
        "numberOfGirlsAged9to14InTheHousehold":
            int.tryParse(howManyGirlsAged9AreInHousehold.text) ?? 0,
        "numberOfU5ChildrenInTheHousehold":
            int.tryParse(under5ChildrenMotherHave.text) ?? 0,
      },
      "children":
          List.generate(textFieldCountNumberOfUnder5Children.value, (j) {
        return {
          //"age": selectedAges[j],
          "name": nameofChildControllerLoop[j].text,
          "dateOfBirth":
              selectedDatesLoop[j].value?.toLocal().toString().split(' ')[0],
          "age":
              '${selectedChildAgeDaysLoop[j].value}, ${selectedChildAgeMonthsLoop[j].value}, ${selectedChildAgeYearsLoop[j].value}',
          "sex": selectedGenderLoop[j].value,
          "receivedPolioVaccineBefore":
              selectedChildEverReceivedPolioVaccineInPastLoop[j].value,
          "receivedRoutineVaccineBefore":
              selectedChildEverReceivedRoutineVaccinesInPastLoop[j].value,
          "hasRIVaccinationCard": selectedHaveRiVaccinationCardLoop[j].value,
          "antigensReceived": selectedAntigensLoop[j].toList(),
          "howManyVisitsHasChildHad":
              int.tryParse(howManyVisitChildHadToHealthFacilityLoop[j].text) ??
                  0,
          "lastVaccinationSite": siteOfLastVaccineLoop[j].text,
          "primaryCareGiverName": nameOfPrimaryCareGiverOfChildLoop[j].text,
          "relationshipOfCaregiverToChild":
              selectedRelationShipOfPrimaryCareGiverOfChildLoop[j].value,
          "careGiverPhoneNumber":
              phoneNumberOfPrimaryCareGiverOfChildLoop[j].text,
          /*  "hasVaccinationCard":
              selectedHaveRiVaccinationCardLoop[j].value == "Yes", */
          /*  "antigensReceived": vaccineSelections[j]
                    ?.keys
                    .where((key) => vaccineSelections[j]?[key] == true)
                    .toList(), */
        };
      }),
      "pregnantWomen":
          List.generate(textFieldCountOtherPregnantWomenInHouseHold.value, (i) {
        return {
          "name": fullNamePregnantWomanControllerLoop[i].text,
          "hasTheWomanVisitedHealthFacilityForANC":
              selectedHasWomanVisitedHealthFacilityForAncLoop[i].value,
          "numberOFAncVisits": int.tryParse(
                  howManyTimesTheWomanVisitedHealthFacilityControllerPregnantLoop[
                          i]
                      .text) ??
              0,
          "phoneNumberOfPregnantWoman":
              phoneNumberOfPregnantWomanControllerLoop[i].text,
        };
      }),
      "latitude": currentPosition.value?.latitude,
      "longitude": currentPosition.value?.longitude,
      "submittedBy": Get.find<LoginController>().loginModel.value?.id ??
          '3fa85f64-5717-4562-b3fc-2c963f66afa6'
      /* "motherDetails": {
        "numberOfMothers": textFieldCountMothersInTheHouseHold.value,
        "mothers":
            List.generate(textFieldCountMothersInTheHouseHold.value, (i) {
          return {
            "name": mothersNameControllerLoop[i].text,
            "phoneNumber": mothersPhoneNumberControllerLoop[i].text,
            "isPregnant": selectedIsMotherPregnantLoop[i].value == "Yes",
            "monthsPregnant": selectedMonthsPregnantMotherLoop[i].value ?? '',
            "ttTdDoses": selectedDosesTDVaccineTakenMotherLoop[i].value ?? '',
            "ancVisits": int.tryParse(
                    timesTheWomanVisitedHealthFacilityControllerLoop[i].text) ??
                0,
            "hasPregnantWomanStartedAnc":
                selectedHasPregnantWomanStartedAncLoop[i].value ?? '',
            "nameOfHealthcareFacilityForAnc":
                nameHealthCareFacilityWomanReceivesAntenatalCareControllerMotherLoop[
                            i]
                        .text ??
                    '',
            "numberOfChildrenUnder5":
                textFieldCountNumberOfUnder5Children.value ?? '',
            "children":
                List.generate(textFieldCountNumberOfUnder5Children.value, (j) {
              return {
                "name": nameofChildControllerLoop[j].text,
                "dateOfBirth": selectedDatesLoop[j].value?.toIso8601String(),
                //"age": selectedAges[j],
                "age":
                    '${selectedChildAgeDaysLoop[j].value}, ${selectedChildAgeMonthsLoop[j].value}, ${selectedChildAgeYearsLoop[j].value}',
                "gender": selectedGenderLoop[j].value,
                "hasVaccinationCard":
                    selectedHaveRiVaccinationCardLoop[j].value == "Yes",
                "nameOfHealthcareFacilityForVaccination":
                    nameOfHFChildGoesForVaccinationLoop[j].value ?? '',
                /*  "antigensReceived": vaccineSelections[j]
                    ?.keys
                    .where((key) => vaccineSelections[j]?[key] == true)
                    .toList(), */
                "antigensReceived": selectedAntigensLoop[j].toList(),
                "healthFacilityVisits": int.tryParse(
                        howManyVisitChildHadToHealthFacilityLoop[j].text) ??
                    0,
                "lastVaccinationSite": siteOfLastVaccineLoop[j].text,
              };
            })
          };
        })
      } */
      /* "pregnantWomenDetails": {
        "numberOfPregnantWomenWhoAreNotMothers":
            textFieldCountOtherPregnantWomenInHouseHold.value ?? '',
        "pregnantWomen": List.generate(
            textFieldCountOtherPregnantWomenInHouseHold.value, (i) {
          return {
            "fullName": fullNamePregnantWomanControllerLoop[i].text,
            "monthsPregnant": selectedHowManyMonthsPregnantLoop[i].value ?? '',
            "ttTdDoses": selectedDosesTDVaccineTakenPregnantLoop[i].value ?? '',
            "ancVisits": int.tryParse(
                    howManyTimesTheWomanVisitedHealthFacilityControllerPregnantLoop[
                            i]
                        .text) ??
                0,
            "nameOfHealthcareFacilityForAnc":
                nameHealthCareFacilityWomanReceivesAntenatalCareControllerPregnantLoop[
                        i]
                    .text,
          };
        })
      }, */
      /* "wcbaDetails": {
        "otherWomenAgedBetween15And55":
            selectedOtherWomenInTheHousehold.value ?? '',
        "howManyOtherWomenAgedBetween15And55":
            textFieldCountHowManyOtherWomenAreThereInHouseHold.value ?? '',
        "wcbAs": List.generate(
            textFieldCountHowManyOtherWomenAreThereInHouseHold.value, (i) {
          return {
            "firstName": firstNameOtherWomenControllerLoop[i].text,
            "lastName": surNameOtherWomenControllerLoop[i].text
          };
        })
      }, */
    };

    //debugPrint(data.toString());
    log(data.toString(), name: "my_log");

    return data;
  }

  Future<Map<String, dynamic>> getMap() async {
    List<Map<String, dynamic>> answersListMap = [
      {'questionId': 'IEV001', 'answerText': nameOfEnumerator.text},
      {'questionId': "IEV002", 'answerText': phoneNumber.text},
      {'questionId': "IEV002", 'answerText': phoneNumber.text},
      {'questionId': 'IEV003', 'answerText': teamCode.text},
      {'questionId': 'IEV004', 'answerText': stateValue.value ?? ''},
      {'questionId': 'IEV005', 'answerText': lgaValue.value ?? ''},
      {'questionId': 'IEV006', 'answerText': wardValue.value ?? ''},
      {'questionId': 'IEV007', 'answerText': selectedSettlement.value ?? ''},
      {'questionId': 'IEV008', 'answerText': houseNumber.text},
      {'questionId': 'IEV010', 'answerText': headOfHouseHoldName.text},
      {'questionId': 'IEV011', 'answerText': headOfHousePhoneNumber.text},
      //mothers phone number
      {'questionId': 'IEV012', 'answerText': numberOfMothersInTheHouse.text},
      {'questionId': 'IEV013', 'answerText': mothersName.text},

      {'questionId': 'IEV014', 'answerText': mothersPhoneNumber.text},
      {
        'questionId': 'IEV015',
        'answerText': selectedIsMotherPregnant.value ?? ''
      },
      {
        'questionId': 'IEV016',
        'answerText': selectedMonthsPregnantMother.value ?? ''
      },
      {
        'questionId': 'IEV017',
        'answerText': selectedDosesTDVaccineTakenMother.value ?? ''
      },
      {
        'questionId': 'IEV018',
        'answerText': numberOfAncVisitsToHealthFacilityMother.text
      },
      {'questionId': 'IEV019', 'answerText': under5ChildrenMotherHave.text},
      {'questionId': 'IEV020', 'answerText': nameofChild.text},
      {'questionId': 'IEV021', 'answerText': selectDateOfBirth.toString()},
      {'questionId': 'IEV022', 'answerText': selectedAgeCategory.value ?? ''},
      {'questionId': 'IEV023', 'answerText': selectedGender.value ?? ''},
      {
        'questionId': 'IEV024',
        'answerText': selectedHaveRiVaccinationCard.value ?? ''
      },
      {
        'questionId': 'IEV026',
        'answerText': howManyVisitChildHadToHealthFacility.text
      },
      {'questionId': 'IEV027', 'answerText': siteOfLastVaccine.text},
      {'questionId': 'IEV028', 'answerText': numberOfPregnantWomen.text},
      {
        'questionId': 'IEV029',
        'answerText': '${firstname.text} ${surname.text}'
      },
      {
        'questionId': 'IEV030',
        'answerText': selectedMonthsPregnant.value ?? ''
      },
      {
        'questionId': 'IEV031',
        'answerText': selectedDosesTDVaccineTaken.value ?? ''
      },
      {
        'questionId': 'IEV032',
        'answerText': numberOfAncVisitsToHealthFacility.text
      },
      {
        'questionId': 'IEV033',
        'answerText': selectedOtherWomenInTheHousehold.value ?? ''
      },
      {
        'questionId': 'IEV034',
        'answerText': '${firstnameWoman.text} ${surnameWoman.text}'
      },
      {'questionId': 'IEV036', 'answerText': hasWomanTTIDVaccine.value ?? ''},
    ];

    List<Map<String, dynamic>> antigenAnswersList = selectReceivedAntigens
        .map((antigen) => {
              'name': antigen,
              'response':
                  selectedReceivedAntigens.value.contains(antigen) == true
                      ? "true"
                      : "false"
            })
        .toList();

    Map<String, dynamic> iEVData = {
      'submittedBy': Get.find<LoginController>().loginModel.value?.id ??
          '3fa85f64-5717-4562-b3fc-2c963f66afa6',
      'longitude': currentPosition.value?.longitude,
      'latitude': currentPosition.value?.latitude,
      'answers': answersListMap,
      'antigenAnswers': antigenAnswersList,
    };
    return iEVData;
  }

  void getState() async {
    List<String> states = await networkService.getState() ?? [];

    listState.clear();

    states.insert(0, "Select State");
    stateValue.value = "Select State";

    listState.assignAll(states ?? []);
  }

  void getLga(String state) async {
    var states = await networkService.getLga(state);

    // listLga.clear();
    states!.insert(0, "Select Lga");
    lgaValue.value = states[0];
    listLga.assignAll(states ?? []);
  }

  void getWard(String state, String lga) async {
    var states = await networkService.getwards(state, lga);

    // listWard.clear();
    states!.insert(0, "Select Ward");
    wardValue.value = states[0];
    listWard.assignAll(states ?? []);
  }

  void getSettlement(
      String state, String lga, String ward, String teamCode) async {
    var states = await networkService.getSettlement(state, lga, ward, teamCode);

    // listSettlement.clear();
    List<String> mylistSettle = [];
    mylistSettle = states!.map((user) => user.name ?? "").toList() ?? [];
    mylistSettle.insert(0, "Select Settlement");
    listSettlement.assignAll(mylistSettle);
  }

  Future<void> submitData(BuildContext context) async {
    try {
      showLoaderDialog(context, true);
      Map<String, dynamic> iEVData = await newMapData();
      //Map<String, dynamic> iEVData = await getMap();

      final response = await networkService.submitIEVDataNew(iEVData);
      if (response) {
        showLoaderDialog(context, false);
        showSuccessModal(context);
      }
    } on DioException catch (e) {
      showLoaderDialog(context, false);
      snackBar(context,
          title: 'Something is wrong',
          backgroundColor: AppPalette.red.red350,
          textColor: AppPalette.white);
      debugPrint(e.toString());
    }
  }

  getStateLocally() {
    List<String> states = listStateWardLgaMap
        .map((item) => item["state"] as String)
        //.toSet()
        .toList();
    //listState.clear();

    /* states.insert(0, "Select State");
    stateValue.value = "Select State";

    listState.assignAll(states); */
  }

  getLGALocally(String selectedState) {
    List<String> lgas = listStateWardLgaMap
        .where((item) => item["state"] == "Abia") // Filter by state
        .map((item) => item["lga"] as String) // Extract LGAs
        .toSet() // Ensure unique LGAs
        .toList(); // Convert back to list

    lgas.insert(0, "Select Lga");
    lgaValue.value = lgas[0];
    listLga.assignAll(lgas ?? []);
  }

  getWardLocally(String selectedState, String selectedLGA) {
    List<String> wards = listStateWardLgaMap
        .where((item) =>
            item["state"].toLowerCase() == selectedState.toLowerCase() &&
            item["lga"].toLowerCase() ==
                selectedLGA.toLowerCase()) // Filter by state
        .map((item) => item["ward"] as String) // Extract LGAs
        .toSet() // Ensure unique LGAs
        .toList(); // Convert back to list
    wards.insert(0, "Select Ward");
    wardValue.value = wards[0];
    listWard.assignAll(wards ?? []);
  }

  getSettlementLocally(
      String selectedState, String selectedLGA, String selectedWard) {
    List<String> settlements = listStateWardLgaMap
        .where((item) =>
            item["state"].toLowerCase() == selectedState.toLowerCase() &&
            item["lga"].toLowerCase() == selectedLGA.toLowerCase() &&
            item["ward"].toLowerCase() ==
                selectedWard.toLowerCase()) // Filter by state
        .map((item) => item["settlement"] as String) // Extract LGAs
        .toSet() // Ensure unique LGAs
        .toList(); // Convert back to list
    //List<String> mylistSettle = [];
    // mylistSettle = states!.map((user) => user.name ?? "").toList() ?? [];
    settlements.insert(0, "Select Settlement");
    selectedSettlement.value = "Select Settlement";
    listSettlement.assignAll(settlements);
  }

/*   getWardLocally(String state, String lga) {
    //"	Kano	Takai	@	Farun Ruwa	&	Jigawa K/Fada	"	,
    List<String> myward = [];
    print("$state $lga");
    myward = listOfSettlementValue
        .where(
          (item) =>
              // item.toLowerCase().contains(state.toLowerCase().trim()) &&
              item.toLowerCase().contains(lga.toLowerCase().trim()),
        )
        .map((item) => removeExtraSpaces(item)
            .trim()
            .split("@")
            .last
            .trim()
            .split("&")
            .first)
        //  .map((item) => item.split(" & "))
        .toSet()
        .toList();
    print(myward);
    wardValue.value = myward[0];
    listWard.assignAll(myward ?? []);
  }

  getSettlementLocally(String state, String lga, String ward) {
    //"	Kano	Takai	@	Farun Ruwa	&	Jigawa K/Fada	"	,
    List<String> listWardr = [];
    print("$state $lga $ward");
    listWardr = listOfSettlementValue
        .where(
          (item) =>
              item.toLowerCase().contains(state.toLowerCase().trim()) &&
              item.toLowerCase().contains(ward.toLowerCase().trim()) &&
              item.toLowerCase().contains(lga.toLowerCase().trim()),
        )
        .map((item) => removeExtraSpaces(item).split(" & ").last)
        //  .map((item) => item.split(" & "))
        .toSet()
        .toList();
    print(listWardr);
    selectedSettlement.value = listWardr[0];
    listSettlement.assignAll(listWardr);
  }

  String removeExtraSpaces(String text) {
    return text.replaceAll(RegExp(r"\s+"), " ").trim();
  } */

  void submitDataLocally(BuildContext context) async {
    DateTime now = DateTime.now();

    Map<String, dynamic> iEVData = await getMap();
    iEVData["date"] = DateFormat('MM/dd/yyyy').format(now);
    iEVData["time"] = DateFormat('hh:mm a').format(now);
    iEVData["myUniqueId"] = const Uuid().v4().toString();
    final storageService = LocalStorageService(key: "my_storage_key");
    var list = await storageService.getList();
    if (list.isEmpty) {
      await storageService.saveList([iEVData]);
    } else {
      await storageService.addItem(iEVData);
    }
    Get.find<OfflineController>().listMap.refresh();
    Get.find<OfflineController>().getLocal();
    Get.find<HomeController>().getLocal();
    showSuccessModal(context);
  }

  void showSuccessModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color(0xffFEFEFE),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
      context: context,
      builder: (builder) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const Wrap(
            children: [
              SuccessModal(),
            ],
          ),
        );
      },
    );
  }
}
