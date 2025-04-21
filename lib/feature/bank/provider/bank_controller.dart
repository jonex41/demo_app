import 'package:demo_app/component/loader.dart';
import 'package:demo_app/core/offline_storage.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/bank/widget/sucess_widget.dart';
import 'package:demo_app/feature/home/provider/home_binding.dart';
import 'package:demo_app/feature/home/provider/home_controller.dart';
import 'package:demo_app/feature/iev_data_collection/modal/success_modal.dart';
import 'package:demo_app/feature/util/utils.dart' as util;
import 'package:demo_app/model/home/bank_account_model.dart';
import 'package:demo_app/model/home/search_model.dart';
import 'package:demo_app/network/network_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/router/locator.dart';
import '../../../core/router/router.dart';

class BankController extends GetxController {
  final networkService = Get.find<NetworkService>();
  final formKeyEditProfile = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  final isLoading = false.obs;
  final roleDesignation = "Role".obs;
  final selectedBank = "".obs;
  final hintBank = "".obs;
  final hintDesignation = "".obs;

  final currentPage = 1.obs;
  final perPage = 20;

  final selectedGender = Rxn<String>();
  final isEditing = false.obs;
  final List<String> gender = ['male', 'female'].obs;
  final listDesignation = <String>[].obs;

  final listBankDetails = <BankAccountModel>[].obs;
  final listBankDetailsCopy = <BankAccountModel>[].obs;
  final listBank = <String>[].obs;
  final bankDetailsForm = GlobalKey<FormState>();
  final Rxn<DateTime> _dateOfBirth = Rxn<DateTime>();
  final Rxn<BankAccountModel> selectedBankDetails = Rxn<BankAccountModel>();
  final searchTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final phoneNumberTextController = TextEditingController();
  final accountNumberTextController = TextEditingController();
  final accountNameTextController = TextEditingController();
  final listUser = <SearchModel>[
    const SearchModel(title: "Aguda John Omotayo"),
    const SearchModel(title: "Mr Foo"),
    const SearchModel(title: "Usman Fori"),
    const SearchModel(title: "Muhammed"),
    const SearchModel(title: "Hauwa Abdullahi Sani"),
    const SearchModel(title: "Usman Fori"),
    const SearchModel(title: "Mass Man"),
  ].obs;

  final listMap = <Map<String, dynamic>>[].obs;
  final listMapCopy = <Map<String, dynamic>>[].obs;
  int selectedIndex = 0;

  @override
  void onInit() {
    _scrollController.addListener(_onScroll);
    getRoleDesignation();
    getBankAccountDetails();

    super.onInit();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !isLoading.value) {
      _fetchMoreData();
    }
  }

  Future<void> _fetchMoreData() async {
    isLoading.value = true;

    // Simulate network delay

    await getDataOnline(currentPage.value);
    isLoading.value = false;
    currentPage.value++;
  }

  setDateOfBirth(DateTime? value) {
    _dateOfBirth.value = value;
  }

  Future<void> getDataOnline(int page) async {
    var map = await networkService.getAllDataIEVNew(page);
    print("online data $map");
    if (page == 1) {
      listMap.clear();
      listMapCopy.clear();
    }

    listMap.value.addAll(convertList(map));
    listMapCopy.addAll(listMap);
    /*
    listMapCopy.addAll(listMap); */
  }

  fillData() {
    if (selectedBankDetails.value != null) {
      accountNumberTextController.text =
          selectedBankDetails.value?.accountNumber ?? "";
      accountNameTextController.text =
          selectedBankDetails.value?.accountName ?? "";
      nameTextController.text = selectedBankDetails.value?.fullName ?? "";
      phoneNumberTextController.text =
          selectedBankDetails.value?.phoneNumber ?? "";
      hintDesignation.value = selectedBankDetails.value?.designation ?? "Role";
      hintBank.value = selectedBankDetails.value?.bankName ?? "Bank Name";
      hintDesignation.value = selectedBankDetails.value?.designation ?? "Role";
      hintBank.value = selectedBankDetails.value?.bankName ?? "Bank Name";
      selectedBank.value = selectedBankDetails.value?.bankName ?? "Bank Name";
    }
  }

  clearData() {
    accountNumberTextController.clear();
    accountNameTextController.clear();
    nameTextController.clear();
    phoneNumberTextController.clear();
    roleDesignation.value = "";
    selectedBank.value = "";
    hintDesignation.value = "Select designation";
    hintBank.value = "Select bank";
  }

  Future<void> getRoleDesignation() async {
    try {
      var response = await networkService.getDesignation();
      listDesignation.clear();
      listDesignation.assignAll(response ?? []);
    } on Exception catch (e) {
      listDesignation.clear();
      listDesignation.assignAll([
        "Data Clerk/Enumerator",
        "Auxiliary Community Based Health Worker",
        "Junior Community Health Extension Worker",
        "Community Leader",
        "Local Guide",
        "Ward Focal Person",
        "National Supervisor",
        "State Supervisor",
        "LGA Supervisor",
        "Ward Supervisor",
        "Other"
      ]);

      // TODO
    }
    // print("online data $map");
  }

  Future<void> getBank() async {
    try {
      var response = await networkService.getBanks();
      listBank.clear();
      listBank.assignAll(response ?? []);
    } on Exception catch (e) {
      listBank.clear();
      listBank.assignAll([
        "9 PAYMENT SOLUTIONS BANK",
        "AAA FINANCE",
        "ACCELEREX NETWORK LIMITED",
        "ACCESS BANK",
        "ACCESS MONEY",
        "ACCESS YELLO & BETA",
        "ACCESS(DIAMOND) BANK",
        "AKWA SAVINGS & LOANS LIMITED",
        "ALTERNATIVE BANK LIMITED",
        "ASO SAVINGS",
        "Branch International Finance Company Limited",
        "BRIDGEWAY MICROFINANACE BANK",
        "CARBON",
        "CBN",
        "CBN_TSA",
        "CELLULANT",
        "CHANELLE BANK",
        "CITI BANK",
        "CORONATION MERCHANT BANK",
        "COUNTY FINANCE LTD",
        "CRYSTAL FINANCE COMPANY LIMITED",
        "DIGNITY FINANCE",
        "EARTHOLEUM",
        "ECOBANK",
        "ECOBANK XPRESS ACCOUNT",
        "ECOMOBILE",
        "ENAIRA",
        "ENCO FINANCE",
        "ENTERPRISE BANK",
        "ETRANZACT",
        "EYOWO",
        "FAST CREDIT",
        "FBNQUEST MERCHANT BANK",
        "FCMB MOBILE",
        "FETS",
        "FEWCHORE FINANCE COMPANY LIMITED",
        "FIDELITY BANK",
        "FIDELITY MOBILE",
        "FIRST BANK OF NIGERIA",
        "FIRST CITY MONUMENT BANK",
        "FIRSTMONIE WALLET",
        "FORTIS MOBILE",
        "FSDH",
        "FUNDQUEST FINANCIAL SERVICES LTD",
        "GIREI MICROFINANACE BANK",
        "GLOBUS BANK",
        "GREENWICH MERCHANT BANK",
        "GT MOBILE",
        "GTBANK PLC",
        "HEDONMARK",
        "HERITAGE BANK",
        "HOPEPSB",
        "INNOVECTIVES KESH",
        "ITEX INTEGRATED SERVICES LIMITED",
        "JAIZ BANK",
        "JUBILEE LIFE",
        "KEGOW",
        "KEGOW(CHAMSMOBILE)",
        "KEYSTONE BANK",
        "KONGAPAY",
        "LAGOS BUILDING AND INVESTMENT COMPANY",
        "LOTUS BANK",
        "M36",
        "MOMO PAYMENT SERVICE BANK ",
        "MONEY BOX",
        "MONEY MASTER PSB",
        "NEW PRUDENTIAL BANK",
        "NEWEDGE FINANCE LTD",
        "NIP VIRTUAL BANK",
        "NOVA MERCHANT BANK",
        "NOWNOW DIGITAL SYSTEMS LIMITED",
        "OPAY",
        "OPTIMUS BANK",
        "PAGA",
        "PALMPAY",
        "PARALLEX BANK",
        "PARKWAY-READYCASH",
        "PAYSTACK-TITAN",
        "POLARIS BANK",
        "PREMIUM TRUST  BANK",
        "PROVIDUS BANK",
        "RAND MERCHANT BANK",
        "SAFETRUST",
        "SAGEGREY FINANCE LIMITED",
        "SIGNATURE BANK",
        "SIMPLE FINANCE LIMITED",
        "SMARTCASH PAYMENT SERVICE BANK",
        "SPARKLE",
        "STANBIC IBTC @EASE WALLET",
        "STANBIC IBTC BANK",
        "STANDARD CHARTERED BANK",
        "STERLING BANK",
        "STERLING MOBILE",
        "SUNTRUST BANK",
        "TAGPAY",
        "TAJ BANK",
        "TAJWALLET",
        "TANGERINE MONEY",
        "TEASY MOBILE",
        "TEKLA FINANCE LTD",
        "TEST BANK",
        "TITAN TRUST BANK",
        "TRINITY FINANCIAL SERVICES LIMITED",
        "UBA MONI",
        "UNION BANK",
        "UNITED BANK FOR AFRICA",
        "UNITY BANK",
        "VALE FINANCE LIMITED",
        "VT NETWORKS",
        "WEMA BANK",
        "WINVIEW BANK",
        "XPRESS PAYMENTS",
        "XPRESS WALLET",
        "ZEDVANCE FINANCE LIMITED",
        "ZENITH BANK",
        "ZENITH EASY WALLET",
        "ZENITH MOBILE",
      ]);
      // TODO
    }
    // print("online data $map");
  }

  Future<void> getBankAccountDetails() async {
    try {
      isLoading.value = true;
      var response = await networkService.getBankAccountDetails();
      listBankDetails.clear();
      listBankDetailsCopy.clear();
      // var myList = response?.reversed.toList() ?? [];
      listBankDetails.assignAll(response ?? []);
      listBankDetailsCopy.addAll(response ?? []);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }

    /*  listBank.value.clear();
    listBank.assignAll(response ?? []);
    // print("online data $map"); */
  }

  Future<void> submitData(BuildContext context) async {
    final isValid = bankDetailsForm.currentState!.validate();
    if (!isValid) {
      return;
    }

    showLoaderNew(context);
    //submit data locally
    if (!await isNetworkAvailable()) {
      print("i am offline");
      submitDataLocally(context);
       hideLoaderNew();
      return;
    }
    try {
      var response = await networkService.postBankAccountDetails({
        "accountNumber": accountNumberTextController.text,
        "accountName": accountNameTextController.text,
        "bankName": selectedBank.value,
        "fullName": nameTextController.text,
        "phoneNumber": phoneNumberTextController.text,
        "designation": roleDesignation.value,
      });
      hideLoaderNew();
      if (response) {
        showSuccessModal(
            context, "Data Submitted", "Data submitted successfully");
      } else {
        showErrorSnackbar(context, "An error occurred");
      }
    } on DioException catch (e) {
      hideLoaderNew();
      showErrorSnackbar(context, e.response!.data['message']);
      print(e);
    } catch (e) {
      hideLoaderNew();
      showErrorSnackbar(context, "An error occurred");
      print(e);
    }
  }

  void submitDataLocally(BuildContext context) async {
    Map<String, dynamic> iEVData = {
      "accountNumber": accountNumberTextController.text,
      "accountName": accountNameTextController.text,
      "bankName": selectedBank.value,
      "fullName": nameTextController.text,
      "phoneNumber": phoneNumberTextController.text,
      "designation": roleDesignation.value,
    };

    final storageService = LocalStorageService(key: "my_storage_bank_key");
    var list = await storageService.getList();
    if (list.isEmpty) {
      await storageService.saveList([iEVData]);
    } else {
      await storageService.addItem(iEVData);
    }
    /*  Get.find<OfflineController>().listMap.refresh();
    Get.find<OfflineController>().getLocal();
    Get.find<HomeController>().getLocal(); */
    showSuccessModal(
        context, "Data Submitted Locally", "Data submitted successfully");
  }

  Future<void> submitEditData(BuildContext context) async {
    final isValid = bankDetailsForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    showLoaderNew(context);
    try {
      var response = await networkService
          .editBankDetails(selectedBankDetails.value?.id ?? "", {
        "accountNumber": accountNumberTextController.text,
        "accountName": accountNameTextController.text,
        "bankName": selectedBank.value,
        "fullName": nameTextController.text,
        "phoneNumber": phoneNumberTextController.text,
        "designation": roleDesignation.value,
      });
      hideLoaderNew();
      if (response) {
        getBankAccountDetails();
        showSuccessModal(
            context, "Data Submitted", "Data submitted successfully");
        getBankAccountDetails();
      } else {
        showErrorSnackbar(context, "An error occurred");
      }
    } on DioException catch (e) {
      hideLoaderNew();
      showErrorSnackbar(context, e.response!.data['message']);
      print(e);
    } catch (e) {
      hideLoaderNew();
      showErrorSnackbar(context, "An error occurred");
      print(e);
    }
  }

  Future<void> deleteData(BuildContext context) async {
    showLoaderNew(context);
    try {
      var response = await networkService.deleteBankDetails(
        selectedBankDetails.value?.id ?? "",
      );
      hideLoaderNew();
      if (response) {
        showSuccessModal(context, "Deleted", "Deleted successfully");
        getBankAccountDetails();
      } else {
        showErrorSnackbar(context, "An error occurred");
      }
    } on DioException catch (e) {
      hideLoaderNew();
      showErrorSnackbar(context, e.response!.data['message']);
      print(e);
    } catch (e) {
      hideLoaderNew();
      showErrorSnackbar(context, "An error occurred");
      print(e);
    }
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

  void getLocal() async {
    final storageService = LocalStorageService(key: "my_storage_key");
    listMap.clear();
    print("i am in reload screen");
    listMap.value = await storageService.getList();
    listMap.value.assignAll(await storageService.getList());
    Get.find<HomeController>().pendingSync.value = listMap.length;
    listMapCopy.addAll(listMap);
  }

  String getValueMap(int index, String id) {
    List<Map<String, dynamic>> maps = convertList(listMap[index]["answers"]);
    for (var map in maps) {
      if (map["questionId"] == id) {
        return map["answerText"];
      }
    }
    return "not Found";
  }

  String getValueMap2(List<Map<String, dynamic>> maps, String id) {
    for (var map in maps) {
      if (map["questionId"] == id) {
        return map["answerText"];
      }
    }
    return "not Found";
  }

  List<Map<String, dynamic>> getMotherDetails(
    int index,
  ) {
    return convertList(listMap[index]["motherDetails"]["mothers"]);
  }

  List<Map<String, dynamic>> getMotherChidrenDetails(dynamic e) {
    return convertList(e);
  }

  List<Map<String, dynamic>> getPregnantMotherDetails(
    int index,
  ) {
    return convertList(listMap[index]["pregnantWomanDetails"]["pregnantWomen"]);
  }

  List<Map<String, dynamic>> getWcbaDetails(
    int index,
  ) {
    return convertList(listMap[index]["wcbaDetails"]["wcbAs"]);
  }

  List<Map<String, dynamic>> convertList(List<dynamic> data) {
    return List<Map<String, dynamic>>.from(
        data.map((item) => Map<String, dynamic>.from(item)));
  }

  void showSuccessModal(BuildContext context, String title, String message) {
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
          child: Wrap(
            children: [
              SucessWidget(title, message),
            ],
          ),
        );
      },
    );
  }

  void onTextChange(String value) {
    if (value.trim().isNotEmpty) {
      listBankDetails.value.clear();
      listBankDetails.value = listBankDetailsCopy.where((item) {
        return item.accountName!
            .toLowerCase()
            .contains(value.trim().toLowerCase());
      }).toList();
      /*   listBankDetails.value.clear();
      listBankDetails.value.addAll(results); */
    } else {
      listBankDetails.value.clear();
      listBankDetails.value.addAll(listBankDetailsCopy);
    }
  }
}
