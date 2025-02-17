import 'package:auto_route/annotations.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/feature/encounter_reg_house/provider/encouter_reg_house_controller.dart';
import 'package:demo_app/feature/encounter_reg_house/widget/search_item.dart';
import 'package:demo_app/model/home/search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import '../../../component/search_field.dart';

@RoutePage()
class EncouterRegHoNewScheduleScreen
    extends GetView<EncouterRegHouseController> {
  const EncouterRegHoNewScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            const AppAppBar(title: "New Scheduled"),
            10.height,
            MySearchWidget(
              controller: controller.searchTextController,
              callBack: (value) {
                // controller.onTextChangeR(value);
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
                () => GridView.count(
                    shrinkWrap: true,
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this would produce 2 rows.
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    // Generate 100 Widgets that display their index in the List
                    children: [
                      ...controller.listUser.map((e) {
                        return InkWell(
                          onTap: () {
                            appRoute
                                .push(const EncouterRegHouseSchedule1Route());
                            // controller.gotoDeliveryScreen(e);
                          },
                          child: SearchItem(
                            searchModel: e,
                          ),
                        );
                      })
                    ]),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
