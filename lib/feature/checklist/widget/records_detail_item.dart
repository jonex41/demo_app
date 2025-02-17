import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

class RecordsDetailItem extends StatefulWidget {
  const RecordsDetailItem({super.key});

  @override
  State<RecordsDetailItem> createState() {
    return _RecordsDetailItemState();
  }
}

class _RecordsDetailItemState extends State<RecordsDetailItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppPalette.grey.gray300,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                circleName(
                  context,
                  "Aguda John",
                ),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aguda John",
                      textAlign: TextAlign.center,
                      style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    5.height,
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
                )
              ],
            ),
            // 10.height,
          ],
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
