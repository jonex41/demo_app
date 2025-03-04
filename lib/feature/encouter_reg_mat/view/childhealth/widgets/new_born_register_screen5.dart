import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class NewBornRegisterScreen5 extends StatefulWidget {
  const NewBornRegisterScreen5({super.key});

  @override
  State<NewBornRegisterScreen5> createState() => _NewBornRegisterScreen5State();
}

class _NewBornRegisterScreen5State extends State<NewBornRegisterScreen5> {
  final controller =
      Get.put<EncouterRegMatController>(EncouterRegMatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKeyNewBornScreen5,
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
                      const AppTextFieldHeader(title: 'Referral Made:'),
                      5.height,
                      Obx(() {
                        return MultiSelectDialogField(
                          title: const Text(
                              "You can select more than one option",
                              style: TextStyle(fontSize: 13)),
                          buttonIcon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: AppPalette.grey.gray350,
                          ),
                          itemsTextStyle: const TextStyle(
                            fontSize: 13,
                          ),
                          selectedItemsTextStyle: const TextStyle(
                            fontSize: 13,
                          ),
                          decoration: BoxDecoration(
                            //  color: AppPalette.grey.gray300,
                            border: Border.all(
                              color: AppPalette.grey.gray300,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          items: controller.selectReferralMade
                              .map((e) => MultiSelectItem(
                                    e,
                                    e,
                                  ))
                              .toList(),
                          listType: MultiSelectListType.LIST,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select an Option';
                            } else {
                              return null;
                            }
                          },
                          onConfirm: (values) {
                            controller.selectedReferralMade.value = values;

                            debugPrint(
                                'selectedCareGiverCounselledOn: ${controller.selectedReferralMade}');
                          },
                        );
                      }),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Is Pre-Referral Treatment Given?'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value: controller
                            .selectedIsPreReferralTreatmentGiven.value,
                        items: controller.optionYesNo,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedIsPreReferralTreatmentGiven.value =
                              value;
                        },
                      ),
                      30.height,
                      header('Pre-Referral Treatment'),
                      18.height,
                      const AppTextFieldHeader(
                          title: 'Pre-Referral Treatment Given'),
                      5.height,
                      AncDropDownButton(
                        hint: 'Select an option',
                        value:
                            controller.selectedPreReferralTreatmentGiven.value,
                        items: controller.preReferralTreatmentGiven,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select an Option';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          controller.selectedPreReferralTreatmentGiven.value =
                              value;
                        },
                      ),
                      18.height,
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

  Widget header(String name) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: const BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Text(
          name,
          style: context.theme.appTextTheme.bodyMedium16.copyWith(
            fontSize: 14,
            color: AppPalette.black,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
