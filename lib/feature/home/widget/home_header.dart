/* import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/model/scan/scan_model.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget(
      {super.key,
      required this.name,
      required this.time,
      required this.model,
      this.isOnline = false});
  final String name;
  final String time;
  final bool isOnline;
  final ScanModel? model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28.0,
              backgroundImage: NetworkImage(model?.user?.picture ?? ""),
            ),
            /*   Container(
              //margin: EdgeInsets.all(20),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppPalette.primary.primary100,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  name.substring(0, 1).toUpperCase(),
                  style: context.myTheme.appTextTheme.bodyLarge18.copyWith(
                      fontWeight: FontWeight.w500, color: AppPalette.black),
                ),
              ),
            ), */
            20.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$time ',
                      style: context.myTheme.appTextTheme.bodySmall14.copyWith(
                          fontFamily: GoogleFonts.jura().fontFamily,
                          fontWeight: FontWeight.w500,
                          color: AppPalette.white),
                    ),
                    // Assets.icons.search.svg(),
                  ],
                ),
                Text(
                  name,
                  style: context.myTheme.appTextTheme.bodyMedium16.copyWith(
                      fontFamily: GoogleFonts.jura().fontFamily,
                      fontWeight: FontWeight.w700,
                      color: AppPalette.white),
                ),
              ],
            ),

            /*  const Spacer(),
        
            Align(
                alignment: Alignment.topRight,
                child: Assets.images.icons.notification.image()), */

            const Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  appRoute.push(const NotificationRoute());
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppPalette.primary.primary400,
                    //  border: Border.all(),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_none,
                    color: AppPalette.white,
                  ),
                ),
              ),
            ),
            5.width
          ],
        ),
      ),
    );
  }
}
 */