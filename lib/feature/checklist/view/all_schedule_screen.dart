import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';

@RoutePage()
class AllScheduleScreen extends StatefulWidget {
  const AllScheduleScreen({super.key});

  @override
  State<AllScheduleScreen> createState() => _AllScheduleScreenState();
}

class _AllScheduleScreenState extends State<AllScheduleScreen> {
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
                    colorFilter: const ColorFilter.mode(
                        AppPalette.black, BlendMode.srcIn)),
              ),
            ),
          )),
      body: Container(
        color: AppPalette.white,
        width: MediaQuery.of(context).size.width,
        child: const Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /* Text(
                      'Hello World',
                      style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        color: AppPalette.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ) */
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
