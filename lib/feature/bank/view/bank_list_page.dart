import 'package:auto_route/annotations.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/bank/provider/bank_controller.dart';

import 'package:demo_app/feature/offline/widget/offline_card.dart';
import 'package:demo_app/model/home/search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../component/search_field.dart';

@RoutePage()
class BankListScreen extends GetView<BankController> {
  const BankListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppElevatedButton(
              textColor: AppPalette.white,
              color: AppPalette.primary.primary400,
              height: 45,
              width: MediaQuery.of(context).size.width - 30,
              radius: 8,
              text: 'Add New Bank Details',
              onPressed: () async {
                controller.isEditing.value = false;
                controller.clearData();
                appRoute.push(const BankDetailsRoute());
              },
            ),
            10.height
          ],
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, bottom: 50, top: 10),
        child: Column(
          children: [
            const AppAppBar(title: "Bank Records", showBackButton: true),
            // 10.height,
            MySearchWidget(
              controller: controller.searchTextController,
              callBack: (value) {
                controller.onTextChange(value);
              },
            ),
            8.height,
            /*  Obx(() {
              if (!controller.isLoading.value) return Container();
        
              return CircularProgressIndicator(
                color: AppPalette.primary.primary400,
              );
            }), */
            /*  Obx(() {
              if (!controller.isLoading.value && controller.listUser.isEmpty) {
                return Column(
                  children: [
                    200.height,
                    Text(
                      'No user found',
                      style: context.theme.appTextTheme.bodyLarge18.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }
        
              return Container();
            }), */
            Flexible(
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: AppPalette.primary.primary400,
                        ),
                      ),
                    );
                  }
                  if (controller.listBankDetails.isEmpty) {
                    return Column(
                      children: [
                        100.height,
                        Text(
                          'No bank details found',
                          style:
                              context.theme.appTextTheme.bodyMedium16.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  }
                  return GridView.count(
                      shrinkWrap: true,
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this would produce 2 rows.
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      // Generate 100 Widgets that display their index in the List
                      children: [
                        ...controller.listBankDetails.map((e) {
                          //  int index = controller.listMap.indexOf(e);
                          int index = controller.listBankDetails.indexOf(e);

                          DateTime dateTime = DateTime.parse(
                              controller.listBankDetails[index].createdAt ??
                                  "2025-02-22T21:56:35.826912");
                          String formattedDate =
                              DateFormat("dd/MM/yyyy").format(dateTime);
                          String formattedTime =
                              DateFormat("h:mm a").format(dateTime.toLocal());
                          return InkWell(
                            onTap: () {
                              controller.isEditing.value = true;
                              controller.selectedBankDetails.value = e;
                              controller.fillData();
                              appRoute.replace(const BankDetailsViewRoute());
                            },
                            child: OfflineCard(
                              searchModel: SearchModel(
                                  title: controller
                                      .listBankDetails[index].accountName,
                                  time: formattedTime,
                                  date: formattedDate),
                            ),
                          );
                        })
                      ]);
                },
              ),
            ),
            //150.height,
          ],
        ),
      ),
    ));
  }
}
