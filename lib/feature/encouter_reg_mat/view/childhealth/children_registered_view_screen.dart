import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/button.dart';
import 'package:demo_app/components/app_text_field_header.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class ChildrenRegisteredViewScreen extends StatefulWidget {
  const ChildrenRegisteredViewScreen({super.key});

  @override
  State<ChildrenRegisteredViewScreen> createState() => _ChildrenRegisteredViewScreenState();
}

class _ChildrenRegisteredViewScreenState extends State<ChildrenRegisteredViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Asma\'u Umar',
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
              30.height,
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: header(context, 'Caregiver’s Name', 'Angwar Hausa')),
                        Expanded(child: header(context, 'Caregiver’s Contact', '08037867439')),
                      ],
                    ),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: header(context, 'Child’s Name', 'Maryam Abdullahi')),
                        Expanded(child: header(context, 'Sex', 'Female')),
                      ],
                    ),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: header(context, 'Date of Birth', '14/02/2025')),
                        Expanded(child: header(context, 'Age (in Months)', '18 months')),
                      ],
                    ),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFEF6FF),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Text(
                          'Visit Details',
                          style: context.theme.appTextTheme.bodyMedium16.copyWith(
                            fontSize: 14,
                            color: AppPalette.black,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    12.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: header(context, 'Date of Visit', '14/02/2025')),
                        Expanded(child: header(context, 'Settlement', 'Angwar Hausa')),
                      ],
                    ),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: header(context, 'House No', 'CHIPS/260102/01/01')),
                        Expanded(child: header(context, 'Household No', 'CHIPS/260102/01/01002')),
                      ],
                    ),
                    12.height,
                    const Divider(
                      color: Color(0xffF5F5F5),
                    ),
                    12.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: header(context, 'Type of Visit', 'Follow-up')),
                      ],
                    ),
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
                    20.height,
                    AppOutlinedButton(
                        width: MediaQuery.of(context).size.width,
                        onPressed: () async {},
                        text: 'Delete Form',
                        color: const Color(0xffE80101),
                        textColor: const Color(0xffE80101),
                        height: 50.0,
                        radius: 8,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                    40.height,
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
