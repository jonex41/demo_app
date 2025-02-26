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
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_bar_steppers/stepper_data.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart'; // Import compute()

class IEVDataCollectionController extends GetxController {
  final networkService = Get.find<NetworkService>();
  final Rxn<Position> currentPosition = Rxn<Position>();

  final loadingCoordinate = false.obs;
  final nameOfEnumerator = TextEditingController();
  final phoneNumber = TextEditingController();
  final teamCode = TextEditingController();
  final ward = TextEditingController();
  final houseNumber = TextEditingController();

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

  final stateValue = NigerianStatesAndLGA.allStates[0].obs;
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
    'male',
    'female',
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
  final List<String> dosesTDVaccineTakenMother =
      ['TT1', 'TT2', 'TT3', 'TT4', 'TT5', 'None'].obs;

  final selectedDosesTDVaccineTaken = Rxn<String>();
  final List<String> dosesTDVaccineTaken =
      ['TT1', 'TT2', 'TT3', 'TT4', 'TT5', 'None'].obs;

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

  final selectedKnowDateOfBirth = Rxn<String>();
  final List<String> knowDateOfBirth = [
    'Yes',
    'No',
  ].obs;

  @override
  void onInit() {
    //getState();
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
      Map<String, dynamic> iEVData = await getMap();

      final response = await networkService.submitIEVData(iEVData);
      if (response != null) {
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
