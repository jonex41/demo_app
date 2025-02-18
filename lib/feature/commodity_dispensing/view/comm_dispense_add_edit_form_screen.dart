import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/commodity_dispensing/provider/commodity_dispense_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

@RoutePage()
class CommDispenseAddEditFormScreen extends StatefulWidget {
  const CommDispenseAddEditFormScreen({super.key});

  @override
  State<CommDispenseAddEditFormScreen> createState() => _CommDispenseAddEditFormScreenState();
}

class _CommDispenseAddEditFormScreenState extends State<CommDispenseAddEditFormScreen> {
  final controller = Get.put<CommodityDispenseController>(CommodityDispenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Commodity Dispensation Form',
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
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hello World',
                      style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        color: AppPalette.black,
                        fontWeight: FontWeight.w600,
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
}
