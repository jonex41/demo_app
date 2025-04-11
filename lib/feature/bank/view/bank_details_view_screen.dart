import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/dropdown_text.dart';
import 'package:demo_app/component/input_text_with_text.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/components/anc_drop_down_button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/components/input_decoration.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/bank/provider/bank_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class BankDetailsViewScreen extends GetView<BankController> {
  const BankDetailsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getBank();
    controller.getRoleDesignation();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: Column(
              children: [
                const AppAppBar(title: "Bank Records", showBackButton: true),
                Form(
                    key: controller.bankDetailsForm,
                    child: Container(
                      color: AppPalette.white,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                10.height,
                                header(context,
                                    'Team member bank registration form'),
                                18.height,
                                5.height,
                                AbsorbPointer(
                                  child: MyInputTextWidget(
                                    title: "Name of individual",
                                    showRequired: true,
                                    keyboardType: TextInputType.name,
                                    textColor: Colors.black,
                                    callBack: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Field is required';
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: controller.nameTextController,
                                    hint: 'Enter name',
                                  ),
                                ),
                                15.height,
                                AbsorbPointer(
                                  child: MyInputTextWidget(
                                    title: "Phone Number",
                                    showRequired: true,
                                    keyboardType: TextInputType.number,
                                    textColor: Colors.black,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Field is required';
                                      } else {
                                        if (value.length != 11) {
                                          return 'Phone number must be 11 digits';
                                        } else {
                                          return null;
                                        }
                                        //  return null;
                                      }
                                    },
                                    callBack: (value) {},
                                    controller:
                                        controller.phoneNumberTextController,
                                    hint: 'Enter phone number',
                                  ),
                                ),
                                18.height,
                                Obx(
                                  () => MyDropDownWidget(
                                    onChange: (value) {
                                      controller.roleDesignation.value = value;
                                    },
                                    titile: "Role/designation",
                                    children: controller.listDesignation.value,
                                    //  hintText: controller.selectedDate.value,
                                    isEnabled: false,
                                    hintText: controller.hintDesignation.value,
                                    showRequired: true,
                                    validator: (value) {
                                      if (controller.isEditing.isTrue) {
                                        return null;
                                      }
                                      if (value == null || value.isEmpty) {
                                        return 'Field is required';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                18.height,
                                Text(
                                  "Bank Name",
                                  style: context.theme.appTextTheme.bodyMedium16
                                      .copyWith(
                                    color: AppPalette.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                5.height,
                                Obx(() => AbsorbPointer(
                                          child: getDropDown(context),
                                        ) /*  MyDropDownWidget(
                                    onChange: (value) {
                                      controller.selectedBank.value = value;
                                    },
                                    titile: "Bank name",

                                    children: controller.listBank.value,
                                    //  hintText: controller.selectedDate.value,
                                    isEnabled: true,
                                    hintText: controller.hintBank.value,
                                    showRequired: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Field is required';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ), */
                                    ),
                                18.height,
                                AbsorbPointer(
                                  child: MyInputTextWidget(
                                    title: "Account Number",
                                    showRequired: true,
                                    keyboardType: TextInputType.number,
                                    textColor: Colors.black,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Field is required';
                                      } else {
                                        if (value.length != 10) {
                                          return 'Account number must be 10 digits';
                                        } else {
                                          return null;
                                        }
                                        //  return null;
                                      }
                                    },
                                    callBack: (value) {
                                      if (value.trim().isNotEmpty) {
                                        if (value.length == 10) {
                                          // controller.getBankAccountDetails(value);
                                        }
                                      }
                                    },
                                    controller:
                                        controller.accountNumberTextController,
                                    hint: 'Enter account number',
                                  ),
                                ),
                                18.height,
                                AbsorbPointer(
                                  child: MyInputTextWidget(
                                    title: "Account Name",
                                    showRequired: true,
                                    keyboardType: TextInputType.name,
                                    textColor: Colors.black,
                                    callBack: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Field is required';
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller:
                                        controller.accountNameTextController,
                                    hint: 'Enter account name',
                                  ),
                                ),
                                40.height,
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppElevatedButton(
                                        text: " Edit",
                                        height: 45,
                                        onPressed: () {
                                          appRoute
                                              .push(const BankDetailsRoute());
                                        },
                                      ),
                                    ),
                                    10.width,
                                    Expanded(
                                      child: AppElevatedButton(
                                        text: "Delete",
                                        width: context.width,
                                        height: 45,
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context1) =>
                                                  AlertDialog(
                                                    title: const Text("Delete"),
                                                    content: const Text(
                                                        'Are you sure you want to delete this Bank Details?'),
                                                    actions: [
                                                      TextButton(
                                                        child: const Text(
                                                            "Cancel"),
                                                        onPressed: () async {
                                                          appRoute.pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        style:
                                                            const ButtonStyle(),
                                                        onPressed: () async {
                                                          Navigator.pop(
                                                              context);
                                                          controller.deleteData(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            "Delete"),
                                                      )
                                                    ],
                                                  ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                18.height,
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getDropDown(BuildContext context) {
    return DropdownSearch<String>(
      // key: dropDownKey,
      selectedItem: controller.selectedBank.value,
      items: (filter, infiniteScrollProps) => controller.listBank.value,
      onChanged: (value) {
        controller.selectedBank.value = value!;
      },
      decoratorProps: DropDownDecoratorProps(
          decoration: inputDecoration(
              fillColor: AppPalette.white, hintText: "Select Bank")),
      popupProps: const PopupProps.menu(
          showSearchBox: true,
          fit: FlexFit.loose,
          constraints: BoxConstraints()),
    );
  }

  Widget header(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFE6E6E6),
      ),
      child: Text(
        title,
        style: context.theme.appTextTheme.bodyMedium16.copyWith(
          //s color: AppPalette.dark.dark50,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
