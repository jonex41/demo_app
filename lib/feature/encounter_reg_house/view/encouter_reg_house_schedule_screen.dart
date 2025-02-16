import 'package:auto_route/annotations.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encounter_reg_house/provider/encouter_reg_house_controller.dart';
import 'package:demo_app/feature/encounter_reg_house/widget/patient_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;
/* import 'package:opticcs_app/src/core/theme/new_theme/app_color.dart';
import 'package:opticcs_app/src/core/theme/new_theme/app_theme.dart';
import 'package:opticcs_app/src/features/patient_record/widget/patient_item.dart';
import 'package:opticcs_app/src/model/testing/search_model.dart';
 */
import '../../../component/my_appbar.dart';
import '../../../component/search_field.dart';
/* import '../../testing/widget/search_item.dart';
import '../provider/patient_record_controller.dart';
import '../widget/card_widget.dart'; */

@RoutePage()
class EncouterRegHouseScheduleScreen
    extends GetView<EncouterRegHouseController> {
  const EncouterRegHouseScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  controller.getUsers();
    return WillPopScope(
      onWillPop: () async {
        // controller.textController.clear();
        // controller.isSearching.value = false;
        // controller.listUser.clear();
        // controller.listUser.addAll(controller.listCopyUser);
        return true;
      },
      child: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              const AppAppBar(
                title: "Schedule",
              ),
              AppElevatedButton(
                onPressed: () {},
                width: context.width,
                text: "Add New Schedule",
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _singleCard(context, "Completed", true),
                  _singleCard(context, "Upcoming", false),
                  _singleCard(context, "Missed", false),
                ],
              ),
              10.height,
              Align(
                  alignment: Alignment.topLeft,
                  child: _singleCard(context, "Upcoming", false)),
              10.height,
              MySearchWidget(
                controller: controller.searchTextController,
                callBack: (value) {
                  /*  controller.onTextChange(
                      value, controller.listUser, controller.listCopyUser); */
                },
              ),
              15.height,
              Expanded(
                child: ListView(
                  children: [
                    //  if (!controller.isSearching.value) 10.height,

                    _recentRecord(),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget _headerWidget(BuildContext context, String s, VoidCallback onTap) {
    return Row(
      children: [
        Text(
          s,
          style: context.theme.appTextTheme.bodySmall14.copyWith(
            fontWeight: FontWeight.w500,
            color: AppPalette.dark.dark50,
          ),
        ),
        const Spacer(),
        /*   InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                'View all',
                style: context.theme.appTextTheme.labelLarge12.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppPalette.dark.dark50,
                ),
              ),
              SvgPicture.asset(Assets.images.icons.arrowSide.path),
            ],
          ),
        ) */
      ],
    );
  }

  Widget _recentRecord() {
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
          itemCount: controller.listUser.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              //controller.selectedModel.value = controller.listUser[index];
              // controller.gotoSinglePatientDate();
            },
            child: PendingItem(model: controller.listUser[index]),
          ),
        ));
  }

  Widget _singleCard(BuildContext context, String s, bool isSelected) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? const Color(0xff2FCF97) : null,
        border: Border.all(
          color: AppPalette.grey.gray300,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            s,
            style: context.theme.appTextTheme.labelLarge12.copyWith(
                color: isSelected ? Colors.white : const Color(0xffC6C7C8),
                fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
/* 
  Widget _pastRecord() {
    return Obx(
      () => GridView.count(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 2,
          childAspectRatio: 1,
          // Generate 100 Widgets that display their index in the List
          children: [
            ...controller.listUser.map((e) {
              return InkWell(
                onTap: () {
                  controller.gotoSinglePatient();
                },
                child: SearchItem(
                  searchModel:
                      SearchModel(title: '${e.firstname} ${e.surname}'),
                ),
              );
            })
          ]),
    );
  }
 */
}
