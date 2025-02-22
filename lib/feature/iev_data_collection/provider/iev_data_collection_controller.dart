import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/iev_data_collection/modal/success_modal.dart';
import 'package:demo_app/feature/util/nigerian_states_and_lga.dart';
import 'package:demo_app/feature/util/utils.dart';
import 'package:demo_app/network/network_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:progress_bar_steppers/stepper_data.dart';

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
  final age = TextEditingController();
  final numberOfAncVisitsToHealthFacility = TextEditingController();
  final numberOfMothersInTheHouse = TextEditingController();
  final howManyVisitChildHadToHealthFacility = TextEditingController();

  final stateValue = NigerianStatesAndLGA.allStates[0].obs;
  final lgaValue = 'Select a Local Government Area'.obs;
  final statesLga = Rxn<List<String>>([]);

  final formKeyScreen1 = GlobalKey<FormState>();
  final formKeyScreen2 = GlobalKey<FormState>();

  final formKeyScreen3 = GlobalKey<FormState>();

  final formKeyScreen4 = GlobalKey<FormState>();

  final Rxn<DateTime> _dateOfBirth = Rxn<DateTime>();

  DateTime? get dateOfBirth => _dateOfBirth.value;

  final Rxn<String> _selectDateOfBirth = Rxn<String>();

  String? get selectDateOfBirth => _selectDateOfBirth.value;

  final Rxn<DateTime> _expectedDateOfDelivery = Rxn<DateTime>();

  DateTime? get expectedDateOfDelivery => _expectedDateOfDelivery.value;

  final Rxn<String> _selectExpectedDateOfDelivery = Rxn<String>();

  String? get selectExpectedDateOfDelivery => _selectExpectedDateOfDelivery.value;

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

  final selectedChildrenUnder5Years = Rxn<String>();
  final List<String> childrenUnder5Years = [
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

  final selectedAreTherePregnantWomenInHousehold = Rxn<String>();
  final List<String> areTherePregnantWomenInHousehold = [
    'Yes',
    'No',
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

  final selectedTakenTDVaccine = Rxn<String>();
  final List<String> takenTDVaccine = [
    'Yes',
    'No',
  ].obs;

  final selectedDosesTDVaccineTaken = Rxn<String>();
  final List<String> dosesTDVaccineTaken = ['TT1', 'TT2', 'TT3', 'TT4', 'TT5', 'None'].obs;

  final selectedCommenceANCVisits = Rxn<String>();
  final List<String> commenceANCVisits = [
    'Yes',
    'No',
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

  setSelectedExpectedDateOfDelivery(String? value) {
    _selectExpectedDateOfDelivery.value = value;
  }

  setExpectedDateOfDelivery(DateTime? value) {
    _expectedDateOfDelivery.value = value;
  }

  void setNgState(String ngState) {
    stateValue.value = ngState;
    debugPrint(stateValue.value);
  }

  void setNgLGA(String ngLGA) {
    lgaValue.value = ngLGA;
    debugPrint(lgaValue.value);
  }

  Future<void> submitData(BuildContext context) async {
    try {
      showLoaderDialog(context, true);
      List<Map<String, dynamic>> answersListMap = [
        {'questionId': 'IEV001', 'answerText': nameOfEnumerator.text},
        {'questionId': "IEV002", 'answerText': phoneNumber.text},
        {'questionId': "IEV002", 'answerText': phoneNumber.text},
        {'questionId': 'IEV003', 'answerText': teamCode.text},
        {'questionId': 'IEV004', 'answerText': stateValue.value},
        {'questionId': 'IEV005', 'answerText': lgaValue.value},
        {'questionId': 'IEV006', 'answerText': ward.text},
        {'questionId': 'IEV007', 'answerText': selectedSettlement.value},
        {'questionId': 'IEV008', 'answerText': houseNumber.text},
        {'questionId': 'IEV010', 'answerText': headOfHouseHoldName.text},
        {'questionId': 'IEV011', 'answerText': headOfHousePhoneNumber.text},
        {'questionId': 'IEV012', 'answerText': numberOfMothersInTheHouse.text},
        {'questionId': 'IEV013', 'answerText': mothersName.text},
        {'questionId': 'IEV015', 'answerText': selectedIsMotherPregnant.value},
        {'questionId': 'IEV016', 'answerText': selectedMonthsPregnant.value},
        {'questionId': 'IEV017', 'answerText': selectedDosesTDVaccineTaken.value},
        {'questionId': 'IEV018', 'answerText': numberOfAncVisitsToHealthFacility.text},
        {'questionId': 'IEV019', 'answerText': selectedChildrenUnder5Years.value},
        {'questionId': 'IEV020', 'answerText': nameofChild.text},
        {'questionId': 'IEV021', 'answerText': selectDateOfBirth.toString()},
        {'questionId': 'IEV022', 'answerText': selectedAgeCategory.value},
        {'questionId': 'IEV023', 'answerText': selectedGender.value},
        {'questionId': 'IEV024', 'answerText': selectedHaveRiVaccinationCard.value},
        {'questionId': 'IEV026', 'answerText': howManyVisitChildHadToHealthFacility.text},
        {'questionId': 'IEV027', 'answerText': siteOfLastVaccine.text},
        {'questionId': 'IEV028', 'answerText': numberOfPregnantWomen.text},
        {'questionId': 'IEV029', 'answerText': '${firstname.text}  ${surname.text}'},
        {'questionId': 'IEV030', 'answerText': selectedMonthsPregnant.value},
        {'questionId': 'IEV031', 'answerText': selectedDosesTDVaccineTaken.value},
        {'questionId': 'IEV033', 'answerText': selectedOtherWomenInTheHousehold.value},
        {'questionId': 'IEV034', 'answerText': '${firstname.text}  ${surname.text}'},
      ];

      //TODO Please don't remove this commented code until we have final confirmation that this fields are not needed
      /*var answersListMap2 = {
        'selectedAreTherePregnantWomenInHousehold': selectedAreTherePregnantWomenInHousehold.value,
        'age': age.text,
        'selectedMonthsPregnant': selectedMonthsPregnant.value,
        'selectedTakenTDVaccine': selectedTakenTDVaccine.value,
        'selectedCommenceANCVisits.value': selectedCommenceANCVisits.value,
        'selectExpectedDateOfDelivery': selectExpectedDateOfDelivery.toString(),
      };*/

      List<Map<String, dynamic>> antigenAnswersList = selectReceivedAntigens
          .map((antigen) => {
                'name': antigen,
                'response':
                    selectedReceivedAntigens.value?.contains(antigen) == true ? "true" : "false"
              })
          .toList();

      Map<String, dynamic> iEVData = {
        'submittedBy': '3fa85f64-5717-4562-b3fc-2c963f66afa6',
        'longitude': currentPosition.value?.longitude,
        'latitude': currentPosition.value?.latitude,
        'answers': answersListMap,
        'antigenAnswers': antigenAnswersList,
      };
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
