import 'package:auto_route/auto_route.dart';
import 'package:demo_app/components/search_input_decorations.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/commodity_dispensing/provider/commodity_dispense_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class CommDispenseSavedFormsScreen extends StatefulWidget {
  const CommDispenseSavedFormsScreen({super.key});

  @override
  State<CommDispenseSavedFormsScreen> createState() => _CommDispenseSavedFormsScreenState();
}

class _CommDispenseSavedFormsScreenState extends State<CommDispenseSavedFormsScreen> {
  final controller = Get.put<CommodityDispenseController>(CommodityDispenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Saved Forms',
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
              10.height,
              TextFormField(
                //controller: searchKeyword,
                decoration: SearchInputDecoration.kFormStyle.copyWith(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      fontSize: 13, color: Color(0xFF6A707F), fontWeight: FontWeight.w400),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Color(0xff6A707F),
                  ),
                ),
                onChanged: (value) {
                  /* if (value.isNotEmpty) {
                          setState(() {

                            filteredItems =
                                controller.patientsList.where((item) {
                              String fullName =
                                  "${item.firstname} ${item.surname}";
                              String searchValue = value.trim().toLowerCase();
                              String fullNameLower = fullName.toLowerCase();
                              return fullNameLower.contains(searchValue);
                            }).toList();
                          });
                        } else {
                          setState(
                              () => filteredItems = controller.patientsList);
                        } */
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    20.height,
                    InkWell(
                        onTap: () {
                          controller.gotoCommDispenseSavedFormsDetailScreen();
                        },
                        child: const DispenseSavedItem()),
                    20.height,
                    InkWell(
                        onTap: () {
                          controller.gotoCommDispenseSavedFormsDetailScreen();
                        },
                        child: const DispenseSavedItem()),
                    20.height,
                    InkWell(
                        onTap: () {
                          controller.gotoCommDispenseSavedFormsDetailScreen();
                        },
                        child: const DispenseSavedItem()),
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

class DispenseSavedItem extends StatelessWidget {
  const DispenseSavedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffEEFFF9),
        border: Border.all(width: 1.5, color: const Color(0xffEBEBEB)),
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 24, color: Color(0xff212121)),
              5.width,
              Text(
                '15 Lamido Crescent, Wudil Metropolis',
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  fontSize: 13,
                  color: AppPalette.grey.gray350,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          5.height,
          Text(
            'Peters Household',
            style: context.theme.appTextTheme.bodyMedium16.copyWith(
              color: AppPalette.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          20.height,
          Row(
            children: [
              Row(children: [
                const Icon(Icons.account_circle_outlined, size: 24, color: Color(0xff212121)),
                5.width,
                Text(
                  '15 Profiles',
                  style: context.theme.appTextTheme.bodyMedium16.copyWith(
                    fontSize: 13,
                    color: AppPalette.grey.gray350,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ]),
              15.width,
              Row(children: [
                SvgPicture.asset(
                  "assets/icons/dispense.svg",
                ),
                5.width,
                Text(
                  '30 Dispensation',
                  style: context.theme.appTextTheme.bodyMedium16.copyWith(
                    fontSize: 13,
                    color: AppPalette.grey.gray350,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ])
            ],
          )
        ],
      ),
    );
  }
}
