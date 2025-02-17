import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/checklist/provider/checklist_controller.dart';
import 'package:demo_app/feature/checklist/widget/records_detail_item.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class AllRecordsDetailScreen extends StatefulWidget {
  const AllRecordsDetailScreen({super.key});

  @override
  State<AllRecordsDetailScreen> createState() => _AllRecordsDetailScreenState();
}

class _AllRecordsDetailScreenState extends State<AllRecordsDetailScreen> {
  final checklistController = Get.put<ChecklistController>(ChecklistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Hauwa Abdullahi Sani Records',
            style: context.theme.appTextTheme.bodyMedium16.copyWith(
              color: AppPalette.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
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
              14.height,
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: AppPalette.white,
                        border: Border.all(width: 1.5, color: AppPalette.grayLight3),
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 54,
                            height: 54,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 54,
                                    height: 54,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFF2ECE96),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'H',
                                    style: TextStyle(
                                      color: Color(0xFFFEFEFE),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          10.height,
                          Text(
                            'Hauwa Abdullahi Sani',
                            style: context.theme.appTextTheme.bodyMedium16.copyWith(
                              color: AppPalette.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          5.height,
                          Text(
                            'Tell: +234 706 580 8595 | Age: 45years',
                            style: context.theme.appTextTheme.bodyMedium16.copyWith(
                              fontSize: 13,
                              color: AppPalette.grey.gray350,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              singleItem(
                                context,
                                "04/04/2025",
                                Assets.icons.calendar.svg(),
                              ),
                              20.width,
                              singleItem(
                                context,
                                "05:38PM",
                                Assets.icons.clock.svg(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    17.height,
                    ElevatedButton(
                        onPressed: () {
                          checklistController.gotoAddNewChecklistScreen();
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: AppPalette.white,
                            backgroundColor: AppPalette.primary.primary400,
                            padding: const EdgeInsets.all(20.0),
                            fixedSize: const Size(350, 55),
                            textStyle: context.theme.appTextTheme.bodyMedium16.copyWith(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: AppPalette.white,
                                fontWeight: FontWeight.w700),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add New Record',
                              style: TextStyle(
                                color: AppPalette.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: AppPalette.white,
                              size: 20,
                            )
                          ],
                        )),
                    17.height,
                    Text(
                      'Check-List Record',
                      style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        color: AppPalette.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    18.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xff2FCF97).withOpacity(0.2),
                              border: Border.all(width: 1.5, color: const Color(0xffBDFFE8)),
                              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/records_added.svg",
                                ),
                                Text(
                                  'Records Added',
                                  style: context.theme.appTextTheme.bodySmall14.copyWith(
                                    fontSize: 13,
                                    color: AppPalette.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                5.height,
                                Text(
                                  '12',
                                  style: context.theme.appTextTheme.bodySmall14.copyWith(
                                    color: AppPalette.grey.gray350,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        16.width,
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xffC4FF34).withOpacity(0.2),
                              border: Border.all(width: 1.5, color: const Color(0xff92CE00)),
                              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/pending_schedule.svg",
                                ),
                                Text(
                                  'Pending Schedule',
                                  style: context.theme.appTextTheme.bodySmall14.copyWith(
                                    fontSize: 13,
                                    color: AppPalette.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                5.height,
                                Text(
                                  '1',
                                  style: context.theme.appTextTheme.bodySmall14.copyWith(
                                    color: AppPalette.grey.gray350,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    14.height,
                    InkWell(
                        onTap: () {
                          checklistController.gotoEditRecordScreen();
                        },
                        child: const RecordsDetailItem()),
                    5.height,
                    InkWell(
                        onTap: () {
                          checklistController.gotoEditRecordScreen();
                        },
                        child: const RecordsDetailItem()),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget circleName(BuildContext context, String name) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: AppPalette.primary.primary400,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name.substring(0, 1),
          style: context.theme.appTextTheme.bodyLarge18
              .copyWith(fontWeight: FontWeight.w500, color: AppPalette.grey.gray50),
        ),
      ),
    );
  }

  Widget singleItem(BuildContext context, String name, SvgPicture svg) {
    return Row(
      children: [
        svg,
        5.width,
        Text(
          name,
          textAlign: TextAlign.center,
          style: context.theme.appTextTheme.labelLarge12.copyWith(
            fontWeight: FontWeight.w500,
            //color: AppPalette.grey.gray360,
          ),
        ),
      ],
    );
  }
}
