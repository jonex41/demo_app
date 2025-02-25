import 'package:demo_app/core/offline_storage.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/feature/home/provider/home_binding.dart';
import 'package:demo_app/feature/home/provider/home_controller.dart';
import 'package:demo_app/feature/iev_data_collection/modal/success_modal.dart';
import 'package:demo_app/feature/util/utils.dart' as util;
import 'package:demo_app/model/home/search_model.dart';
import 'package:demo_app/network/network_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/router/locator.dart';
import '../../../core/router/router.dart';

class OfflineController extends GetxController {
  final networkService = Get.find<NetworkService>();
  final formKeyEditProfile = GlobalKey<FormState>();

  final selectedGender = Rxn<String>();
  final isOnline = false.obs;
  final List<String> gender = ['male', 'female'].obs;

  final Rxn<DateTime> _dateOfBirth = Rxn<DateTime>();
  final searchTextController = TextEditingController();
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
    if (isOnline.value) {
      getDataOnline();
    } else {
      getLocal();
    }

    super.onInit();
  }

  setDateOfBirth(DateTime? value) {
    _dateOfBirth.value = value;
  }

  void getDataOnline() async {
    var map = await networkService.getAllIEVData();
    print("online data $map");
    listMap.clear();
    listMapCopy.clear();
    listMap.value = convertList(map);
    listMapCopy.addAll(listMap);
    /*
    listMapCopy.addAll(listMap); */
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
    listMap.value.clear();
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

  List<Map<String, dynamic>> getValueAntigenMap(int index) {
    return convertList(listMap[index]["antigenAnswers"]);
  }

  List<Map<String, dynamic>> convertList(List<dynamic> data) {
    return List<Map<String, dynamic>>.from(
        data.map((item) => Map<String, dynamic>.from(item)));
  }

  void submitDataOnline(BuildContext context) async {
    try {
      util.showLoaderDialog(context, true);
      Map<String, dynamic> iEVData = listMap[selectedIndex];
      iEVData.remove("date");
      iEVData.remove("time");
      String uniqueId = iEVData["myUniqueId"].toString();
      iEVData.remove("myUniqueId");
      final response = await networkService.submitIEVData(iEVData);
      if (response != null) {
        final storageService = LocalStorageService(key: "my_storage_key");
        int newIndex = listMapCopy.indexWhere((item) {
          print("h1 ${item["myUniqueId"].toString()}");
          print("h2 $uniqueId");
          return item["myUniqueId"].toString() == uniqueId;
        });
        print("new index $newIndex");
        storageService.deleteItem(uniqueId);
        getLocal();

        util.showLoaderDialog(context, false);
        showSuccessModal(context);
      }
    } on DioException catch (e) {
      util.showLoaderDialog(context, false);
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

  void onTextChange(String value) {
    if (value.trim().isNotEmpty) {
      List<Map<String, dynamic>> results = listMapCopy.where((item) {
        return getValueMap2(convertList(item["answers"]), "IEV008")
            .toString()
            .contains(value.trim());
      }).toList();
      listMap.clear();
      listMap.addAll(results);
    } else {
      listMap.clear();
      listMap.addAll(listMapCopy);
    }
  }
}
