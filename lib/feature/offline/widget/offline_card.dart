import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encounter_reg_house/widget/picture_container.dart';
import 'package:demo_app/feature/offline/widget/image_container.dart';
import 'package:demo_app/gen/assets.gen.dart';
import 'package:demo_app/model/home/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class OfflineCard extends StatelessWidget {
  const OfflineCard({super.key, required this.searchModel});
  final SearchModel searchModel;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageContainer(
                name: searchModel.title ?? "",
              ),
              10.height,
              Text(
                searchModel.title ?? "Name",
                style: context.theme.appTextTheme.labelLarge12.copyWith(
                    color: const Color(0xff7A7C7F),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800),
              ),
              5.height,
              Row(
                children: [
                  Row(
                    children: [
                      Assets.icons.calendar.svg(
                        width: 16,
                        height: 16,
                        fit: BoxFit.scaleDown,
                        color: const Color(0xff7A7C7F),
                      ),
                      5.width,
                      Text(
                        searchModel.date ?? "",
                        style: context.theme.appTextTheme.labelLarge12.copyWith(
                            color: const Color(0xff7A7C7F),
                            fontSize: 8,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  20.width,
                  Row(
                    children: [
                      Assets.icons.clock.svg(
                        width: 16,
                        height: 16,
                        fit: BoxFit.scaleDown,
                        color: const Color(0xff7A7C7F),
                      ),
                      5.width,
                      Text(
                        searchModel.time ?? "",
                        style: context.theme.appTextTheme.labelLarge12.copyWith(
                            color: const Color(0xff7A7C7F),
                            fontSize: 8,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
