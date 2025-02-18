import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class LogsScreen extends StatefulWidget {
  const LogsScreen({super.key});

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Activity Log',
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
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // controller.gotoFistVisit();
                            },
                            child: myContainer(
                                context,
                                const Color(0xffAEF207),
                                const Color(0xffC4FF34),
                                "Patients",
                                "6990",
                                Assets.icons.smallPaper.path,
                                textColor: const Color(0xFF027D52)),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              //controller.gotoEveryVisit();
                            },
                            child: myContainer(context, const Color(0xff027D52), AppPalette.white,
                                "Households", "5687", Assets.icons.smallPaper.path),
                          ),
                        ),
                      ],
                    ),
                    20.height,
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // controller.gotoSchedule();
                            },
                            child: myContainer(context, const Color(0xff027D52), AppPalette.white,
                                "Schedule", "3455", Assets.icons.smallCalendar.path),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              //controller.gotoDelivery();
                            },
                            child: myContainer(
                                context,
                                const Color(0xffAEF207),
                                const Color(0xffC4FF34),
                                "Visit",
                                "3422",
                                Assets.icons.smallPaper.path,
                                textColor: const Color(0xFF027D52)),
                          ),
                        ),
                      ],
                    ),
                    20.height,
                    InkWell(
                      onTap: () {
                        // controller.gotoTest();
                      },
                      child: myContainer(
                        context,
                        const Color(0xff027D52),
                        AppPalette.white,
                        "Total Records Added",
                        "2344",
                        Assets.icons.smallPaper.path,
                      ),
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget myContainer(BuildContext context, Color cardColor, Color othrColor, String title,
      String amount, String imagePath,
      {Color? textColor}) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, // radius of 10
                  color: othrColor // green as background color
                  ),
              child: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  imagePath,
                  height: 8,
                  width: 8,
                  fit: BoxFit.scaleDown,
                  //color: const Color(0xffD72FEB),
                ),
              ),
            ),
            10.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amount,
                  style: context.theme.appTextTheme.titleLarge28.copyWith(
                      fontWeight: FontWeight.w600, color: textColor ?? AppPalette.lime1.lime50),
                ),
                Text(
                  title,
                  style: context.theme.appTextTheme.bodySmall14.copyWith(
                      fontWeight: FontWeight.w600, color: textColor ?? AppPalette.lime1.lime50),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
