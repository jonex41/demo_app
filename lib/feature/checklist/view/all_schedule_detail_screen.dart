import 'package:auto_route/auto_route.dart';
import 'package:demo_app/component/search_field.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/checklist/provider/checklist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class AllScheduleDetailScreen extends StatefulWidget {
  const AllScheduleDetailScreen({super.key});

  @override
  State<AllScheduleDetailScreen> createState() => _AllScheduleDetailScreenState();
}

class _AllScheduleDetailScreenState extends State<AllScheduleDetailScreen> {
  final controller = Get.put<ChecklistController>(ChecklistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'New Scheduled',
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
              19.height,
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MySearchWidget(
                      controller: controller.searchKeyWord,
                      callBack: (value) {
                        /*  controller.onTextChange(
                      value, controller.listUser, controller.listCopyUser); */
                      },
                    ),
                    13.height,
                    GridView.count(
                        shrinkWrap: true,
                        // Create a grid with 2 columns. If you change the scrollDirection to
                        // horizontal, this would produce 2 rows.
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        // Generate 100 Widgets that display their index in the List
                        children: const [
                          NewScheduleItem(),
                          NewScheduleItem(),
                          NewScheduleItem(),
                          NewScheduleItem(),
                        ])
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewScheduleItem extends StatelessWidget {
  const NewScheduleItem({
    super.key,
  });

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
              Stack(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // radius of 10
                      color: AppPalette.primary.primary100,
                      // green as background color
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 64,
                        width: 64,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2ECE96),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            'Umar'.substring(0, 1),
                            style: context.theme.appTextTheme.titleSmall24.copyWith(
                                fontWeight: FontWeight.w500, color: AppPalette.grey.gray50),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              5.height,
              Flexible(
                child: Text(
                  'Umar Saidu Auna',
                  textAlign: TextAlign.center,
                  style: context.theme.appTextTheme.bodySmall14.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              7.height,
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          width: 12,
                          height: 12,
                        ),
                        2.width,
                        Text(
                          '04/04/2023',
                          style: context.theme.appTextTheme.bodySmall14.copyWith(
                            fontSize: 9,
                            color: const Color(0xFF3B4250),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          width: 12,
                          height: 12,
                        ),
                        2.width,
                        Text(
                          '04/04/2023',
                          style: context.theme.appTextTheme.bodySmall14.copyWith(
                            fontSize: 9,
                            color: const Color(0xFF3B4250),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
