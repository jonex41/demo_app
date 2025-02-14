import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void successSnackBar({String? title = 'Success', String? message}) {
  Future.delayed(const Duration(milliseconds: 10), () async {
    while (Get.isSnackbarOpen) {
      await Get.closeCurrentSnackbar();
    }
    try {
      Get.showSnackbar(
        GetSnackBar(
          title: title,
          message: message,
          backgroundColor: AppPalette.primary.primary400,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          borderRadius: 8,
          dismissDirection: DismissDirection.startToEnd,
          duration: const Duration(seconds: 5),
        ),
      );
    } catch (e) {}
  });
}

void errorSnackBar(
    {String title = 'Error', String? message, bool showTitle = true}) {
  if (message?.startsWith('Exception: ') == true) {
    message = message?.replaceFirst("Exception: ", '');
  } else if (message
          ?.startsWith('DioError [DioErrorType.other]: SocketException: ') ==
      true) {
    message = "Please check your internet connection";
  } else if (message?.startsWith('[firebase_messaging/unknown] ') == true) {
    message = message?.replaceFirst("[firebase_messaging/unknown] ", '');
  }
  Future.delayed(const Duration(milliseconds: 10), () async {
    while (Get.isSnackbarOpen) {
      await Get.closeCurrentSnackbar();
    }
    try {
      Get.showSnackbar(
        GetSnackBar(
          title: showTitle ? title : null,
          message: message,
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          margin:
              showTitle ? const EdgeInsets.all(20) : const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          borderRadius: 8,
          dismissDirection: DismissDirection.startToEnd,
          duration: const Duration(seconds: 5),
        ),
      );
    } catch (e) {}

    debugPrint(message);
  });
}
