import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/encounter_reg_house/widget/picture_container.dart';
import 'package:demo_app/model/home/search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.searchModel});
  final SearchModel searchModel;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PictureContainer(
                name: searchModel.title ?? "",
              ),
              5.height,
              Flexible(
                child: Text(
                  searchModel.title ?? "",
                  textAlign: TextAlign.center,
                  style: context.theme.appTextTheme.bodySmall14.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
