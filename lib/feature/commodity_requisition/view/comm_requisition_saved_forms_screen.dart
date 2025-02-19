import 'package:auto_route/auto_route.dart';
import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/theme/new_theme/app_color.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/commodity_requisition/provider/commodity_requisition_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

@RoutePage()
class CommRequisitionSavedFormsScreen extends StatefulWidget {
  const CommRequisitionSavedFormsScreen({super.key});

  @override
  State<CommRequisitionSavedFormsScreen> createState() => _CommRequisitionSavedFormsScreenState();
}

class _CommRequisitionSavedFormsScreenState extends State<CommRequisitionSavedFormsScreen> {
  final controller = Get.put<CommodityRequisitionController>(CommodityRequisitionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Household Record',
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
                    30.height,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xffEEFFF9),
                        border: Border.all(width: 1.5, color: AppPalette.primary.primary80),
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Requisition and Issuance',
                            style: context.theme.appTextTheme.bodyMedium16.copyWith(
                              fontSize: 13,
                              color: AppPalette.grey.gray350,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          5.height,
                          Text(
                            '10,000KG',
                            style: context.theme.appTextTheme.bodyMedium16.copyWith(
                              color: AppPalette.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    controller.gotoCommRequisitionAddEditFormScreen();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: AppPalette.white,
                                      backgroundColor: AppPalette.primary.primary400,
                                      padding: const EdgeInsets.all(5.0),
                                      fixedSize: const Size(180, 45),
                                      textStyle: context.theme.appTextTheme.bodyMedium16.copyWith(
                                          fontSize: 14,
                                          color: AppPalette.white,
                                          fontWeight: FontWeight.w700),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8))),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Add New Record',
                                        style: TextStyle(color: AppPalette.white, fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: AppPalette.white,
                                        size: 20,
                                      )
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    26.height,
                    InkWell(
                        onTap: () {
                          controller.gotoCommRequisitionViewSavedFormScreen();
                        },
                        child: const RequisitionSavedItem()),
                    10.height,
                    InkWell(
                        onTap: () {
                          controller.gotoCommRequisitionViewSavedFormScreen();
                        },
                        child: const RequisitionSavedItem()),
                    10.height,
                    InkWell(
                        onTap: () {
                          controller.gotoCommRequisitionViewSavedFormScreen();
                        },
                        child: const RequisitionSavedItem()),
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

class RequisitionSavedItem extends StatelessWidget {
  const RequisitionSavedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: const Color(0xffF9F9F9),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Panadol',
                    style: context.theme.appTextTheme.bodyMedium16.copyWith(
                      color: AppPalette.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.height,
                  Text(
                    'May 20th, 2024',
                    style: context.theme.appTextTheme.bodyMedium16.copyWith(
                      fontSize: 13,
                      color: AppPalette.grey.gray350,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text(
                'CHIPS/260102/01/01002',
                style: context.theme.appTextTheme.bodyMedium16.copyWith(
                  fontSize: 13,
                  color: const Color(0xff6D6D6D),
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
