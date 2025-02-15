import 'package:auto_route/auto_route.dart';
import 'package:demo_app/feature/chip_referral/view/chip_referral1_screen.dart';
import 'package:demo_app/feature/chip_referral/view/chip_referral_form1_screen.dart';
import 'package:demo_app/feature/chip_referral/view/chip_referral_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encounter_reg_house1_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_reg_house_log_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_reg_house_record_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_reg_house_schedule_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_reg_house_screen.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/child_health1_screen.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/encouter_reg_mat_screen.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/maternal_service1_screen.dart';
import 'package:demo_app/feature/checklist/view/add_new_checklist_screen.dart';
import 'package:demo_app/feature/checklist/view/add_new_record_screen.dart';
import 'package:demo_app/feature/checklist/view/add_new_schedule_screen.dart';
import 'package:demo_app/feature/checklist/view/all_records_detail_screen.dart';
import 'package:demo_app/feature/checklist/view/all_records_screen.dart';
import 'package:demo_app/feature/checklist/view/all_schedule_detail_screen.dart';
import 'package:demo_app/feature/checklist/view/all_schedule_screen.dart';
import 'package:demo_app/feature/checklist/view/checklist_home_screen.dart';
import 'package:demo_app/feature/checklist/view/logs_screen.dart';

import 'package:demo_app/feature/home/view/home_screen.dart';
import 'package:demo_app/feature/onboarding/view/get_started_screen.dart';
import 'package:demo_app/feature/onboarding/view/partners_screen.dart';
import 'package:demo_app/feature/onboarding/view/splash_screen.dart';
import 'package:demo_app/feature/house_hold_reg/view/house_hold_reg1_screen.dart';
import 'package:demo_app/feature/house_hold_reg/view/house_hold_reg_screen.dart';
import 'package:demo_app/feature/login/view/login_screen.dart';
import 'package:demo_app/feature/profile/view/profile_screen.dart';
import 'package:demo_app/feature/wallet/view/wallet_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(path: '/', page: StartRoute.page),
        //AutoRoute(path: '/', page: HomeRoute.page),
        AutoRoute(path: '/', page: SplashRoute.page),
        AutoRoute(path: '/get_started_screen', page: GetStartedRoute.page),
        AutoRoute(path: '/partnersScreen', page: PartnersRoute.page),
        AutoRoute(path: '/homeScreen', page: HomeRoute.page),
        AutoRoute(path: '/checklistHomeScreen', page: ChecklistHomeRoute.page),
        AutoRoute(
            path: '/addNewChecklistScreen', page: AddNewChecklistRoute.page),
        AutoRoute(path: '/allRecordsScreen', page: AllRecordsRoute.page),
        AutoRoute(
            path: '/allRecordsDetailScreen', page: AllRecordsDetailRoute.page),
        AutoRoute(path: '/addNewRecordScreen', page: AddNewRecordRoute.page),
        AutoRoute(path: '/allScheduleScreen', page: AllScheduleRoute.page),
        AutoRoute(
            path: '/allScheduleDetailScreen',
            page: AllScheduleDetailRoute.page),
        AutoRoute(
            path: '/addNewScheduleScreen', page: AddNewScheduleRoute.page),
        AutoRoute(path: '/loginScreen', page: LoginRoute.page),
        AutoRoute(path: '/home', page: HomeRoute.page),
        AutoRoute(path: '/encounter_reg_mat', page: EncouterRegMatRoute.page),
        AutoRoute(path: '/maternal_service1', page: MaternalService1Route.page),
        AutoRoute(path: '/child_health1', page: ChildHealth1Route.page),
        AutoRoute(path: '/profile', page: ProfileRoute.page),
        AutoRoute(path: '/wallet', page: WalletRoute.page),
        AutoRoute(
            path: '/encouter_reg_house_screen',
            page: EncouterRegHouseRoute.page),
        AutoRoute(
            path: '/encouter_reg_house1_screen',
            page: EncounterRegHouse1Route.page),
        AutoRoute(
            path: '/encouter_reg_house_record',
            page: EncouterRegHouseRecordRoute.page),
        AutoRoute(
            path: '/encouter_reg_house_log',
            page: EncouterRegHouseLogRoute.page),
        AutoRoute(
            path: '/encouter_reg_house_schedule',
            page: EncouterRegHouseScheduleRoute.page),
        AutoRoute(path: '/houseHold_reg_screen', page: HouseHoldRegRoute.page),
        AutoRoute(
            path: '/house_hold_reg1_screen', page: HouseHoldReg1Route.page),
        AutoRoute(path: '/chip_referral_screen', page: ChipReferralRoute.page),
        AutoRoute(
            path: '/chip_referral1_screen', page: ChipReferral1Route.page),
        AutoRoute(
            path: '/chip_referral_form1_screen',
            page: ChipReferralForm1Route.page),
      ];
}
