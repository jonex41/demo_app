import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/component/search_field.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/checklist/provider/checklist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class AllScheduleScreen extends StatefulWidget {
  const AllScheduleScreen({super.key});

  @override
  State<AllScheduleScreen> createState() => _AllScheduleScreenState();
}

class _AllScheduleScreenState extends State<AllScheduleScreen> {
  final controller = Get.put<ChecklistController>(ChecklistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Schedule',
            style: context.theme.appTextTheme.bodyMedium16.copyWith(
              color: AppPalette.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          //centerTitle: true,
          backgroundColor: AppPalette.white,
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: InkWell(
              onTap: () => appRoute.pop(),
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/images/back.svg",
                    colorFilter: const ColorFilter.mode(AppPalette.black, BlendMode.srcIn)),
              ),
            ),
          )),
      body: Container(
        color: AppPalette.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              19.height,
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppElevatedButton(
                      onPressed: () {
                        controller.gotoAddNewScheduleScreen();
                      },
                      width: context.width,
                      text: "Add New Schedule",
                      height: 50,
                      fontSize: 13,
                    ),
                    19.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        singleCard(context, "Completed", true),
                        singleCard(context, "Upcoming", false),
                        singleCard(context, "Missed", false),
                      ],
                    ),
                    20.height,
                    MySearchWidget(
                      controller: controller.searchKeyWord,
                      callBack: (value) {
                        /*  controller.onTextChange(
                      value, controller.listUser, controller.listCopyUser); */
                      },
                    ),
                    21.height,
                    InkWell(
                        onTap: () {
                          controller.gotoAllScheduleDetailScreen();
                        },
                        child: const AllScheduleCard()),
                    12.height,
                    InkWell(
                        onTap: () {
                          controller.gotoAllScheduleDetailScreen();
                        },
                        child: const AllScheduleCard()),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget singleCard(BuildContext context, String s, bool isSelected) {
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
        padding: const EdgeInsets.all(5.0),
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
}

class AllScheduleCard extends StatelessWidget {
  const AllScheduleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: const Color(0x7FC6C7C8)),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppPalette.primary.primary200,
                child: Text(
                  'Umar'.substring(0, 1),
                  style: context.theme.appTextTheme.bodySmall14
                      .copyWith(fontWeight: FontWeight.w500, color: AppPalette.grey.gray50),
                ),
              ),
              15.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Umar Saidu',
                    style: context.theme.appTextTheme.bodyLarge18.copyWith(
                      fontSize: 16,
                      color: AppPalette.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'umarmanofpeace@gmail.com',
                    style: context.theme.appTextTheme.bodySmall14.copyWith(
                      fontSize: 13,
                      color: AppPalette.grey.gray400,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
          10.height,
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/calendar.svg',
                    ),
                    5.width,
                    Text(
                      '04/04/2023',
                      style: context.theme.appTextTheme.bodySmall14.copyWith(
                        fontSize: 12,
                        color: const Color(0xFF3B4250),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/calendar.svg',
                    ),
                    5.width,
                    Text(
                      '04/04/2023',
                      style: context.theme.appTextTheme.bodySmall14.copyWith(
                        fontSize: 12,
                        color: const Color(0xFF3B4250),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 6,
                      backgroundColor: Color(0xFF2DFB30),
                    ),
                    5.width,
                    Text(
                      //completed.status,
                      'Completed',
                      style: context.theme.appTextTheme.bodySmall14.copyWith(
                        fontSize: 12,
                        color: const Color(0xFF3B4250),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
