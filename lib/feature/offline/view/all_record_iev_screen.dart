import 'package:auto_route/annotations.dart';
import 'package:demo_app/component/my_appbar.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/offline/provider/offline_controller.dart';
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
class AllRecordIevScreen extends GetView<OfflineController> {
  const AllRecordIevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            const AppAppBar(
              title: "All Record",
              showBackButton: true,
            ),
            10.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Lists of all synced entries",
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                    color: const Color(0xff2C2D33),
                    fontWeight: FontWeight.w600),
              ),
            ),
            5.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "View all synced entries in the system",
                style: context.theme.appTextTheme.labelLarge12.copyWith(
                    color: const Color(0xff7A7C7F),
                    fontWeight: FontWeight.w400),
              ),
            ),
            10.height,
            MySearchWidget(
              controller: controller.searchTextController,
              hintText: "Search by house number",
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
                () => GridView.count(
                    shrinkWrap: true,
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this would produce 2 rows.
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    // Generate 100 Widgets that display their index in the List
                    children: [
                      ...controller.listMap.value.reversed.map((e) {
                        int index = controller.listMap.indexOf(e);
                        DateTime dateTime = DateTime.parse(
                            controller.listMap[index]["createdAt"] ??
                                "2025-02-22T21:56:35.826912");
                        String formattedDate =
                            DateFormat("dd/MM/yyyy").format(dateTime);
                        String formattedTime =
                            DateFormat("h:mm a").format(dateTime.toLocal());
                        return InkWell(
                          onTap: () {
                            controller.selectedIndex = index;
                            appRoute.push(const OfflineForm1Route());
                            // controller.gotoDeliveryScreen(e);
                          },
                          child: OfflineCard(
                            searchModel: SearchModel(
                                title: controller.listMap[index]["household"]
                                        ?["houseNumber"] ??
                                    "",
                                time: formattedTime,
                                date: formattedDate),
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
