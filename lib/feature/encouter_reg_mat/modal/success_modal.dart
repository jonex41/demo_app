import 'package:demo_app/component/button.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_binding.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class SuccessModal extends StatefulWidget {
  const SuccessModal({super.key});

  @override
  State<SuccessModal> createState() => _SuccessModalState();
}

class _SuccessModalState extends State<SuccessModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              30.height,
              SvgPicture.asset(
                'assets/icons/successful_2.svg',
              ),
              15.height,
              Text(
                'Registration Successful',
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  color: AppPalette.primary.primary400,
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.height,
              Text(
                'Your registration has been successfully completed! Thank you for providing the necessary details.',
                textAlign: TextAlign.center,
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  fontSize: 13,
                  color: AppPalette.dark.dark55,
                  fontWeight: FontWeight.w500,
                ),
              ),
              32.height,
              AppElevatedButton(
                onPressed: () {
                  Get.delete<EncouterRegMatController>();
                  EncouterRegMatBinding().dependencies();
                  appRoute.popUntilRoot();
                },
                width: context.width,
                text: "Done",
                height: 50,
                fontSize: 13,
              ),
              50.height,
            ]));
  }
}
