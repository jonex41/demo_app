import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewBornRegisterScreen4 extends StatefulWidget {
  const NewBornRegisterScreen4({super.key});

  @override
  State<NewBornRegisterScreen4> createState() => _NewBornRegisterScreen4State();
}

class _NewBornRegisterScreen4State extends State<NewBornRegisterScreen4> {
  final controller = Get.put<EncouterRegMatController>(EncouterRegMatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKeyNewBornScreen4,
        child: Container(
          color: AppPalette.white,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hello World',
                        style: context.theme.appTextTheme.bodyMedium16.copyWith(
                          color: AppPalette.black,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
