import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/feature/util/nigerian_states_and_lga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommodityRequisitionController extends GetxController {
  final wardRequisition = TextEditingController();
  final communityDispense = TextEditingController();
  final chipAgentNameRequisition = TextEditingController();
  final chipAgentIdNoRequisition = TextEditingController();
  final requisitionNoRequisition = TextEditingController();
  final clientFirstNameDispense = TextEditingController();
  final unitQuantityRequisition = TextEditingController();
  final quantityRequiredRequisition = TextEditingController();
  final quantityIssuedRequisition = TextEditingController();
  final quantityReceivedRequisition = TextEditingController();

  final stateValue = NigerianStatesAndLGA.allStates[0].obs;
  final lgaValue = 'Select a Local Government Area'.obs;
  final statesLga = Rxn<List<String>>([]);

  final stateValueVotersCard = NigerianStatesAndLGA.allStates[0].obs;
  final lgaValueVotersCard = 'Select a Local Government Area'.obs;
  final statesLgaVotersCard = Rxn<List<String>>([]);

  final formKeyRequisition = GlobalKey<FormState>();

  final Rxn<DateTime> _date = Rxn<DateTime>();

  DateTime? get date => _date.value;

  final Rxn<String> _selectDate = Rxn<String>();

  String? get selectDate => _selectDate.value;

  final selectedFocalPHCFacility = Rxn<String>();
  final List<String> focalPHCFacility =
      ['Facility 1', 'Facility 2', 'Facility 3', 'Facility 4', 'Facility 5'].obs;

  setSelectedDate(String? value) {
    _selectDate.value = value;
  }

  setDate(DateTime? value) {
    _date.value = value;
  }

  void setNgState(String ngState) {
    stateValue.value = ngState;
    debugPrint(stateValue.value);
  }

  void setNgLGA(String ngLGA) {
    lgaValue.value = ngLGA;
    debugPrint(lgaValue.value);
  }

  Future<void> gotoCommRequisitionDashboardScreen() async {
    appRoute.push(const CommRequisitionDashboardRoute());
  }

  Future<void> gotoCommRequisitionSavedFormsScreen() async {
    appRoute.push(const CommRequisitionSavedFormsRoute());
  }

  Future<void> gotoCommRequisitionAddEditFormScreen() async {
    appRoute.push(const CommRequisitionAddEditFormRoute());
  }

  Future<void> gotoCommRequisitionViewSavedFormScreen() async {
    appRoute.push(const CommRequisitionViewSavedFormRoute());
  }
}
