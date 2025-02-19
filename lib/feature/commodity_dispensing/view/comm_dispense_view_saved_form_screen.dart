import 'package:auto_route/auto_route.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/commodity_dispensing/provider/commodity_dispense_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class CommDispenseViewSavedFormScreen extends StatefulWidget {
  const CommDispenseViewSavedFormScreen({super.key});

  @override
  State<CommDispenseViewSavedFormScreen> createState() => _CommDispenseViewSavedFormScreenState();
}

class _CommDispenseViewSavedFormScreenState extends State<CommDispenseViewSavedFormScreen> {
  final controller = Get.put<CommodityDispenseController>(CommodityDispenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Emily Peters',
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
          ),
          actions: [
            InkWell(
              onTap: () {
                controller.gotoCommDispenseAddEditFormScreen();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'Edit Form',
                  style: context.theme.appTextTheme.bodyMedium16.copyWith(
                    fontSize: 13,
                    color: const Color(0xff07AD73),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ]),
      body: Container(
        color: AppPalette.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.height,
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(child: header(context, 'State', 'Niger')),
                        Expanded(child: header(context, 'LGA', 'Bosso')),
                      ],
                    ),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    Row(
                      children: [
                        Expanded(child: header(context, 'Ward', 'Bosso 1')),
                        Expanded(child: header(context, 'Community', 'Bosso 2')),
                      ],
                    ),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    header(context, 'Date Registered by CHIPS Agent', '12/02/2025'),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    header(context, 'Settlement', 'Angwar Hausa'),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    Row(
                      children: [
                        Expanded(child: header(context, 'House No', '50')),
                        Expanded(child: header(context, 'Household No', '55')),
                      ],
                    ),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    Row(
                      children: [
                        Expanded(child: header(context, 'Client First Name', 'James')),
                        Expanded(child: header(context, 'Client Surname', 'Smith')),
                      ],
                    ),
                    12.height,
                    header(context, 'Phone Number', '07065808595'),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    header(context, 'Commodity Name',
                        'Lorem ipsum dolor sit amet consectetur. Tortor.'),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    header(context, 'Quantity Given', '2'),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    38.height,
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            foregroundColor: AppPalette.white,
                            backgroundColor: AppPalette.primary.primary400,
                            padding: const EdgeInsets.all(5.0),
                            fixedSize: Size(MediaQuery.of(context).size.width, 45),
                            textStyle: context.theme.appTextTheme.bodyMedium16.copyWith(
                                fontSize: 14, color: AppPalette.white, fontWeight: FontWeight.w700),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Download PDF',
                              style: TextStyle(color: AppPalette.white, fontSize: 14),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppPalette.white,
                              size: 20,
                            )
                          ],
                        )),
                    30.height,
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context, String title, String body) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFieldHeader(title: title),
        12.height,
        Text(
          body,
          style: context.theme.appTextTheme.bodyMedium16.copyWith(
            fontSize: 13,
            color: const Color(0xff6D6D6D),
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
