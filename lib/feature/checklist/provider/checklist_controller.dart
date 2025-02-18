import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/checklist/provider/checklist_bindings.dart';
import 'package:demo_app/feature/util/nigerian_states_and_lga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_bar_steppers/stepper_data.dart';

class ChecklistController extends GetxController {
  final chipAgentUniqueId = TextEditingController();
  final chipAgentFullName = TextEditingController();
  final community = TextEditingController();
  final ward = TextEditingController();

  final settlement = TextEditingController();
  final houseNumber = TextEditingController();
  final houseHoldNumber = TextEditingController();
  final pregnantWomansName = TextEditingController();

  final searchKeyWord = TextEditingController();
  final childName = TextEditingController();

  final formKeyScreen1 = GlobalKey<FormState>();
  final formKeyScreen2 = GlobalKey<FormState>();

  final formKeyEditRecord = GlobalKey<FormState>();

  final formKeyNewScheule = GlobalKey<FormState>();

  final Rxn<DateTime> _dateRegisteredChipAgent = Rxn<DateTime>();

  DateTime? get dateRegisteredChipAgent => _dateRegisteredChipAgent.value;

  final Rxn<String> _selectDateRegisteredChipAgent = Rxn<String>();

  String? get selectDateRegisteredChipAgent => _selectDateRegisteredChipAgent.value;

  final Rxn<DateTime> _expectedDateOfDelivery = Rxn<DateTime>();

  DateTime? get expectedDateOfDelivery => _expectedDateOfDelivery.value;

  final Rxn<String> _selectExpectedDateOfDelivery = Rxn<String>();

  String? get selectExpectedDateOfDelivery => _selectExpectedDateOfDelivery.value;

  final Rxn<DateTime> _dateOfBirth = Rxn<DateTime>();

  DateTime? get dateOfBirth => _dateOfBirth.value;

  final Rxn<String> _selectDateOfBirth = Rxn<String>();

  String? get selectDateOfBirth => _selectDateOfBirth.value;

  final Rxn<DateTime> _dateOfSchedule = Rxn<DateTime>();

  DateTime? get dateOfSchedule => _dateOfSchedule.value;

  final Rxn<String> _selectDateOfSchedule = Rxn<String>();

  String? get selectDateOfSchedule => _selectDateOfSchedule.value;

  Rxn<TimeOfDay> selectedTime = Rxn<TimeOfDay>();

  final stateValue = NigerianStatesAndLGA.allStates[0].obs;
  final lgaValue = 'Select a Local Government Area'.obs;
  final statesLga = Rxn<List<String>>([]);

  final stateValueVotersCard = NigerianStatesAndLGA.allStates[0].obs;
  final lgaValueVotersCard = 'Select a Local Government Area'.obs;
  final statesLgaVotersCard = Rxn<List<String>>([]);

  final selectedChildGender = Rxn<String>();
  final List<String> childGender = ['male', 'female'].obs;

  final selectedAncFacility = Rxn<String>();
  final List<String> ancFacility =
      ['Facility 1', 'Facility 2', 'Facility 3', 'Facility 4', 'Facility 5'].obs;

  final selectedPncFacility = Rxn<String>();
  final List<String> pncFacility =
      ['DAY 0 (if delivered at home)', 'Day 3', 'Week 2', 'Week 6'].obs;

  final selectedImmunization = Rxn<String>();
  final List<String> immunization = [
    'At Birth (BCG, OPV0, Hep B)',
    '6 Weeks (OPV1, Penta 1, PCV1, Rota 1)',
    '10 Weeks (OPV 2, Penta 2, PCV 2, Rotavirus 2)',
    '14 Weeks (OPV 3, Penta 3, PCV3, IPV)',
    '9 Months (Measles 1st Dose, Yellow Fever, Menigitis)',
    '15 Months (Measles 2nd Dose)'
  ].obs;

  final selectedGrowthMonitoring = Rxn<String>();
  final List<String> growthMonitoring = [
    '0 ≤ 3 Months',
    '3 ≤ 6 Months',
    '6 ≤ 9 Months',
    '9 ≤ 12 Months ',
    '12 ≤ 15 Months',
    '15 ≤ 18 Months',
    '18 ≤ 21 Months',
    '21 ≤ 24 Months',
  ].obs;

  final selectedState = Rxn<String>();
  final allStates = [
    'Abia',
    'Adamawa',
    'Akwa Ibom',
    'Anambra',
    'Bauchi',
    'Bayelsa',
    'Benue',
    'Borno',
    'Cross River',
    'Delta',
    'Ebonyi',
    'Edo',
    'Ekiti',
    'Enugu',
    'Gombe',
    'Imo',
    'Jigawa',
    'Kaduna',
    'Kano',
    'Katsina',
    'Kebbi',
    'Kogi',
    'Kwara',
    'Lagos',
    'Nasarawa',
    'Niger',
    'Ogun',
    'Ondo',
    'Osun',
    'Oyo',
    'Plateau',
    'Rivers',
    'Sokoto',
    'Taraba',
    'Yobe',
    'Zamfara',
    'FCT(Abuja)',
  ].obs;

  final selectedNutritionalService = Rxn<String>();
  final List<String> nutritionalService = [
    '6 Months (Vitamin A)',
    '12 Months (Vitamin A)',
    '12 - 18 Months (Deworming)',
    '18 Months (Vitamin A)',
    '12 - 24 Months (Deworming)',
    '24 Months (Vitamin A)',
  ].obs;

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime.value ?? TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppPalette.primary.primary400,
              colorScheme: ColorScheme.light(
                primary: AppPalette.primary.primary400,
              ),
            ),
            child: child!,
          );
        });

    if (pickedTime != null) {
      selectedTime.value = pickedTime;
      debugPrint(formatTimeOfDay(selectedTime.value ?? TimeOfDay.now()));
    }
  }

  String formatTimeOfDay(TimeOfDay time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  void setNgState(String ngState) {
    stateValue.value = ngState;
    debugPrint(stateValue.value);
  }

  void setNgLGA(String ngLGA) {
    lgaValue.value = ngLGA;
    debugPrint(lgaValue.value);
  }

  setSelectedDateRegisteredChipAgent(String? value) {
    _selectDateRegisteredChipAgent.value = value;
  }

  setDateRegisteredChipAgent(DateTime? value) {
    _dateRegisteredChipAgent.value = value;
  }

  setSelectedExpectedDateOfDelivery(String? value) {
    _selectExpectedDateOfDelivery.value = value;
  }

  setExpectedDateOfDelivery(DateTime? value) {
    _expectedDateOfDelivery.value = value;
  }

  setSelectedDateOfBirth(String? value) {
    _selectDateOfBirth.value = value;
  }

  setDateOfBirth(DateTime? value) {
    _dateOfBirth.value = value;
  }

  setSelectedDateOfSchedule(String? value) {
    _selectDateOfSchedule.value = value;
  }

  setDateOfSchedule(DateTime? value) {
    _dateOfSchedule.value = value;
  }

  List<StepperData> stepsData = [
    StepperData(
      label: '',
    ),
    StepperData(
      label: '',
    ),
  ];
  final currentScreen = 1.obs;

  Future<void> gotoAddNewChecklistScreen() async {
    ChecklistBindings().dependencies();
    appRoute.push(const AddNewChecklistRoute());
  }

  Future<void> gotoAllRecordsScreen() async {
    ChecklistBindings().dependencies();
    appRoute.push(const AllRecordsRoute());
  }

  Future<void> gotoAllScheduleScreen() async {
    ChecklistBindings().dependencies();
    appRoute.push(const AllScheduleRoute());
  }

  Future<void> gotoLogsScreen() async {
    ChecklistBindings().dependencies();
    appRoute.push(const LogsRoute());
  }

  Future<void> gotoAllRecordsDetailScreen() async {
    ChecklistBindings().dependencies();
    appRoute.push(const AllRecordsDetailRoute());
  }

  Future<void> gotoEditRecordScreen() async {
    ChecklistBindings().dependencies();
    appRoute.push(const EditRecordRoute());
  }

  Future<void> gotoAllScheduleDetailScreen() async {
    ChecklistBindings().dependencies();
    appRoute.push(const AllScheduleDetailRoute());
  }

  Future<void> gotoAddNewScheduleScreen() async {
    ChecklistBindings().dependencies();
    appRoute.push(const AddNewScheduleRoute());
  }
}
