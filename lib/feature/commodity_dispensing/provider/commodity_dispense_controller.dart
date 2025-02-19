import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/feature/util/nigerian_states_and_lga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommodityDispenseController extends GetxController {
  final wardDispense = TextEditingController();
  final communityDispense = TextEditingController();
  final settlementDispense = TextEditingController();
  final houseNoDispense = TextEditingController();
  final houseHoldNoDispense = TextEditingController();
  final clientFirstNameDispense = TextEditingController();
  final clientSurnameDispense = TextEditingController();
  final phoneNoDispense = TextEditingController();
  final commodityNameDispense = TextEditingController();
  final quantityGivenDispense = TextEditingController();

  final stateValue = NigerianStatesAndLGA.allStates[0].obs;
  final lgaValue = 'Select a Local Government Area'.obs;
  final statesLga = Rxn<List<String>>([]);

  final stateValueVotersCard = NigerianStatesAndLGA.allStates[0].obs;
  final lgaValueVotersCard = 'Select a Local Government Area'.obs;
  final statesLgaVotersCard = Rxn<List<String>>([]);

  final formKeyDispensation = GlobalKey<FormState>();

  final Rxn<DateTime> _date = Rxn<DateTime>();

  DateTime? get date => _date.value;

  final Rxn<String> _selectDate = Rxn<String>();

  String? get selectDate => _selectDate.value;

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

  Future<void> gotoCommDispenseDashboardScreen() async {
    appRoute.push(const CommDispenseDashboardRoute());
  }

  Future<void> gotoCommDispenseSavedFormsScreen() async {
    appRoute.push(const CommDispenseSavedFormsRoute());
  }

  Future<void> gotoCommDispenseSavedFormsDetailScreen() async {
    appRoute.push(const CommDispenseSavedFormsDetailRoute());
  }

  Future<void> gotoCommDispenseAddEditFormScreen() async {
    appRoute.push(const CommDispenseAddEditFormRoute());
  }

  Future<void> gotoCommDispenseViewSavedFormScreen() async {
    appRoute.push(const CommDispenseViewSavedFormRoute());
  }
}
