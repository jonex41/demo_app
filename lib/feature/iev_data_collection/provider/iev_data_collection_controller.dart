import 'package:demo_app/feature/util/nigerian_states_and_lga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_bar_steppers/stepper_data.dart';

class IEVDataCollectionController extends GetxController {
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

  final stateValue = NigerianStatesAndLGA.allStates[0].obs;
  final lgaValue = 'Select a Local Government Area'.obs;
  final statesLga = Rxn<List<String>>([]);

  final stateValueVotersCard = NigerianStatesAndLGA.allStates[0].obs;
  final lgaValueVotersCard = 'Select a Local Government Area'.obs;
  final statesLgaVotersCard = Rxn<List<String>>([]);

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
    'OPV',
    'Rota 1',
    'Penta 2',
    'Meningitis (MEN A)',
    'Rota 3',
    'Yellow Fever',
    'OPV 0',
    'Penta 1',
    'IPV 1',
    'PCV 2',
    'Penta 3',
    'OPV 3',
    'IPV 2',
    'Hepatitis B',
    'PCV 1',
    'OPV 2',
    'Rota 2',
    'PCV 3',
    'Measles 1',
    'Measles 2',
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
}
