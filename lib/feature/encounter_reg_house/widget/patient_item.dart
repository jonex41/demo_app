import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/model/home/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;
/* import 'package:opticcs_app/src/core/theme/new_theme/app_theme.dart';
import 'package:opticcs_app/src/model/user_model/user_model.dart';
 */
import '../../../../gen/assets.gen.dart';
import '../../../core/theme/new_theme/app_color.dart';

class PendingItem extends StatelessWidget {
  const PendingItem({super.key, required this.model});
  final SearchModel model;
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
                _circleName(
                  context,
                  model.title ?? "Aguda John",
                ),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title ?? "Aguda John",
                      textAlign: TextAlign.center,
                      style: context.theme.appTextTheme.bodyMedium16.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    5.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _singleItem(
                          context,
                          "04/04/2025",
                          Assets.icons.calendar.svg(),
                        ),
                        20.width,
                        _singleItem(
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

  Widget _circleName(BuildContext context, String name) {
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
          style: context.theme.appTextTheme.bodyLarge18.copyWith(
              fontWeight: FontWeight.w500, color: AppPalette.grey.gray50),
        ),
      ),
    );
  }

  Widget _singleItem(BuildContext context, String name, SvgPicture svg) {
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
