import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/home/provider/home_controller.dart';

import 'package:demo_app/gen/assets.gen.dart';

@RoutePage()
class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.isFirst.value) {
    
      controller.isFirst.value = false;
    }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppPalette.primary.primary350,
      statusBarIconBrightness: Brightness.light,
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppPalette.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 80,
          width: context.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(Assets.images.bottom.path),
            fit: BoxFit.fill,
          )),
          /*  decoration: BoxDecoration(
            color: AppPalette.primary.primary350,
            borderRadius: BorderRadius.vertical(
                top:
                    Radius.elliptical(MediaQuery.of(context).size.width, 80.0)),
      
      
          ), */
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.selectedTab.value = 0;
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: controller.selectedTab.value == 0
                              ? AppPalette.primary.primary400
                              : AppPalette.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Assets.icons.homeWhite
                            .svg(height: 40, width: 40, fit: BoxFit.scaleDown)),
                  ),
                ),
                 ],
            ),
          ),
        ),
        body: GestureDetector(
        
          child: RefreshIndicator(
            onRefresh: () async {
              
              return;
            },
            child: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                   
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
