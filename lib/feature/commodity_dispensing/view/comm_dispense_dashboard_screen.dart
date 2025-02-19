import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/commodity_dispensing/provider/commodity_dispense_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class CommDispenseDashboardScreen extends StatefulWidget {
  const CommDispenseDashboardScreen({super.key});

  @override
  State<CommDispenseDashboardScreen> createState() => _CommDispenseDashboardScreenState();
}

class _CommDispenseDashboardScreenState extends State<CommDispenseDashboardScreen> {
  final controller = Get.put<CommodityDispenseController>(CommodityDispenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Community Commodity Dispensation',
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
              20.height,
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppPalette.white,
                        border: Border.all(width: 1.5, color: AppPalette.grayLight3),
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: context.width / 2 - 35,
                                  height: context.height / 5.5,
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color: AppPalette.primary.primary400,
                                    borderRadius: const BorderRadius.all(Radius.circular(19.0)),
                                  ),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/pie_chart.svg",
                                          color: AppPalette.white,
                                        ),
                                        16.height,
                                        Text(
                                          '0',
                                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                            color: AppPalette.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        5.height,
                                        Text(
                                          'Total Settlement',
                                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                            fontSize: 13,
                                            color: AppPalette.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ]),
                                  //child: ,
                                ),
                                10.width,
                                Container(
                                  width: context.width / 2 - 35,
                                  height: context.height / 5.5,
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color: AppPalette.lime1.lime400,
                                    borderRadius: const BorderRadius.all(Radius.circular(19.0)),
                                  ),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/pie_chart.svg",
                                          color: AppPalette.primary.primary400,
                                        ),
                                        16.height,
                                        Text(
                                          '0',
                                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                            color: AppPalette.primary.primary400,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        5.height,
                                        Text(
                                          'Total Household',
                                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                            fontSize: 13,
                                            color: AppPalette.primary.primary400,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ]),
                                  //child: ,
                                )
                              ]),
                          15.height,
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: context.width / 2 - 35,
                                  height: context.height / 5.5,
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color: AppPalette.lime1.lime400,
                                    borderRadius: const BorderRadius.all(Radius.circular(19.0)),
                                  ),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/pie_chart.svg",
                                          color: AppPalette.primary.primary400,
                                        ),
                                        16.height,
                                        Text(
                                          '0',
                                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                            color: AppPalette.primary.primary400,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        5.height,
                                        Text(
                                          'Total Profiles',
                                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                            fontSize: 13,
                                            color: AppPalette.primary.primary400,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ]),
                                  //child: ,
                                ),
                                10.width,
                                Container(
                                  width: context.width / 2 - 35,
                                  height: context.height / 5.5,
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color: AppPalette.primary.primary400,
                                    borderRadius: const BorderRadius.all(Radius.circular(19.0)),
                                  ),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/pie_chart.svg",
                                          color: AppPalette.white,
                                        ),
                                        16.height,
                                        Text(
                                          '0',
                                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                            color: AppPalette.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        5.height,
                                        Text(
                                          'Total Dispensed',
                                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                                            fontSize: 13,
                                            color: AppPalette.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ]),
                                  //child: ,
                                )
                              ])
                        ],
                      ),
                    ),
                    30.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Commodity Dispensation',
                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                            color: AppPalette.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    12.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xffe4e7ec).withOpacity(0.2),
                        border: Border.all(width: 1.5, color: AppPalette.grayLight3),
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        SvgPicture.asset(
                          "assets/icons/person_grey.svg",
                        ),
                        24.height,
                        Text(
                          'View Registered Commodity Dispensation',
                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                            color: AppPalette.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        5.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  controller.gotoCommDispenseSavedFormsScreen();
                                },
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: AppPalette.white,
                                    backgroundColor: AppPalette.primary.primary400,
                                    padding: const EdgeInsets.all(10.0),
                                    fixedSize: const Size(150, 48),
                                    textStyle: context.theme.appTextTheme.bodyMedium16.copyWith(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: AppPalette.white,
                                        fontWeight: FontWeight.w700),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8))),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'View All',
                                      style: TextStyle(
                                        color: AppPalette.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppPalette.white,
                                      size: 16,
                                    )
                                  ],
                                )),
                          ],
                        )
                      ]),
                    ),
                    14.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xff2fcf97).withOpacity(0.2),
                        border: Border.all(width: 1.5, color: AppPalette.primary.primary80),
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        SvgPicture.asset(
                          "assets/icons/person_green.svg",
                        ),
                        24.height,
                        Text(
                          'Register a Commodity Dispensation',
                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                            color: AppPalette.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        5.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  controller.gotoCommDispenseAddEditFormScreen();
                                },
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: AppPalette.white,
                                    backgroundColor: AppPalette.primary.primary400,
                                    padding: const EdgeInsets.all(5.0),
                                    fixedSize: const Size(160, 48),
                                    textStyle: context.theme.appTextTheme.bodyMedium16.copyWith(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: AppPalette.white,
                                        fontWeight: FontWeight.w700),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8))),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Start Registration',
                                      style: TextStyle(
                                        color: AppPalette.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppPalette.white,
                                      size: 16,
                                    )
                                  ],
                                )),
                          ],
                        )
                      ]),
                    ),
                    20.height,
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
