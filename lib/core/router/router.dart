import 'package:auto_route/auto_route.dart';
import 'package:demo_app/feature/activity/view/activity_screen.dart';
import 'package:demo_app/feature/checklist/view/add_new_checklist_screen.dart';
import 'package:demo_app/feature/checklist/view/add_new_schedule_screen.dart';
import 'package:demo_app/feature/checklist/view/all_records_detail_screen.dart';
import 'package:demo_app/feature/checklist/view/all_records_screen.dart';
import 'package:demo_app/feature/checklist/view/all_schedule_detail_screen.dart';
import 'package:demo_app/feature/checklist/view/all_schedule_screen.dart';
import 'package:demo_app/feature/checklist/view/checklist_home_screen.dart';
import 'package:demo_app/feature/checklist/view/edit_record_screen.dart';
import 'package:demo_app/feature/checklist/view/logs_screen.dart';
import 'package:demo_app/feature/chip_referral/view/chip_referral1_screen.dart';
import 'package:demo_app/feature/chip_referral/view/chip_referral_form1_screen.dart';
import 'package:demo_app/feature/chip_referral/view/chip_referral_form2_screen.dart';
import 'package:demo_app/feature/chip_referral/view/chip_referral_form3_screen.dart';
import 'package:demo_app/feature/chip_referral/view/chip_referral_form4_screen.dart';
import 'package:demo_app/feature/chip_referral/view/chip_referral_list_screen.dart';
import 'package:demo_app/feature/chip_referral/view/chip_referral_screen.dart';
import 'package:demo_app/feature/commodity_dispensing/view/comm_dispense_Dashboard_screen.dart';
import 'package:demo_app/feature/commodity_dispensing/view/comm_dispense_add_edit_form_screen.dart';
import 'package:demo_app/feature/commodity_dispensing/view/comm_dispense_home_screen.dart';
import 'package:demo_app/feature/commodity_dispensing/view/comm_dispense_saved_forms_detail_screen.dart';
import 'package:demo_app/feature/commodity_dispensing/view/comm_dispense_saved_forms_screen.dart';
import 'package:demo_app/feature/commodity_dispensing/view/comm_dispense_view_saved_form_screen.dart';
import 'package:demo_app/feature/commodity_requisition/view/comm_requisition_add_edit_form_screen.dart';
import 'package:demo_app/feature/commodity_requisition/view/comm_requisition_dashboard_screen.dart';
import 'package:demo_app/feature/commodity_requisition/view/comm_requisition_home_screen.dart';
import 'package:demo_app/feature/commodity_requisition/view/comm_requisition_saved_forms_screen.dart';
import 'package:demo_app/feature/commodity_requisition/view/comm_requisition_view_saved_form_screen.dart';
import 'package:demo_app/feature/dashboard/view/dashboard.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encounter_reg_house1_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encounter_reg_house2_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encounter_reg_house3_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encounter_reg_house4_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_reg_house_log_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_reg_house_record1_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_reg_house_record_details_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_reg_house_record_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_reg_house_schedule1_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_reg_house_schedule_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_reg_house_screen.dart';
import 'package:demo_app/feature/encounter_reg_house/view/encouter_schedule_list.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/child_health1_screen.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/encouter_reg_mat_screen.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/maternal/maternal_service1_screen.dart';
import 'package:demo_app/feature/encouter_reg_mat/view/maternal/maternal_service2_screen.dart';
import 'package:demo_app/feature/forgot_password/forgot_password_screen.dart';
import 'package:demo_app/feature/home/view/home_screen.dart';
import 'package:demo_app/feature/house_hold_reg/view/house_hold_reg1_screen.dart';
import 'package:demo_app/feature/house_hold_reg/view/house_hold_reg2_screen.dart';
import 'package:demo_app/feature/house_hold_reg/view/house_hold_reg4_screen.dart';
import 'package:demo_app/feature/house_hold_reg/view/house_hold_reg_list_screen.dart';
import 'package:demo_app/feature/house_hold_reg/view/house_hold_reg_screen.dart';
import 'package:demo_app/feature/login/view/login_screen.dart';
import 'package:demo_app/feature/more/view/more_screen.dart';
import 'package:demo_app/feature/offline/view/offline_form2_screen.dart';
import 'package:demo_app/feature/offline/view/offline_screen.dart';
import 'package:demo_app/feature/offline/view/oflline_form1_screen.dart';
import 'package:demo_app/feature/onboarding/view/get_started_screen.dart';
import 'package:demo_app/feature/onboarding/view/partners_screen.dart';
import 'package:demo_app/feature/onboarding/view/splash_screen.dart';
import 'package:demo_app/feature/profile/view/edit_profile_screen.dart';
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
        AutoRoute(path: '/editRecordScreen', page: EditRecordRoute.page),
        AutoRoute(path: '/allScheduleScreen', page: AllScheduleRoute.page),
        AutoRoute(
            path: '/allScheduleDetailScreen',
            page: AllScheduleDetailRoute.page),
        AutoRoute(
            path: '/addNewScheduleScreen', page: AddNewScheduleRoute.page),
        AutoRoute(path: '/logScreen', page: LogsRoute.page),

        AutoRoute(
            path: '/commDispenseHomeScreen', page: CommDispenseHomeRoute.page),
        AutoRoute(
            path: '/commDispenseDashboardScreen',
            page: CommDispenseDashboardRoute.page),
        AutoRoute(
            path: '/commDispenseAddEditFormScreen',
            page: CommDispenseAddEditFormRoute.page),
        AutoRoute(
            path: '/commDispenseSavedFormsDetailScreen',
            page: CommDispenseSavedFormsDetailRoute.page),
        AutoRoute(
            path: '/commDispenseSavedFormsScreen',
            page: CommDispenseSavedFormsRoute.page),
        AutoRoute(
            path: '/commDispenseViewSavedFormScreen',
            page: CommDispenseViewSavedFormRoute.page),

        AutoRoute(
            path: '/commRequisitionHomeScreen',
            page: CommRequisitionHomeRoute.page),
        AutoRoute(
            path: '/commRequisitionDashboardScreen',
            page: CommRequisitionDashboardRoute.page),
        AutoRoute(
            path: '/commRequisitionAddEditFormScreen',
            page: CommRequisitionAddEditFormRoute.page),
        AutoRoute(
            path: '/commRequisitionSavedFormsScreen',
            page: CommRequisitionSavedFormsRoute.page),
        AutoRoute(
            path: '/commRequisitionViewSavedFormScreen',
            page: CommRequisitionViewSavedFormRoute.page),

        AutoRoute(path: '/loginScreen', page: LoginRoute.page),
        AutoRoute(path: '/home', page: HomeRoute.page),
        AutoRoute(path: '/encounter_reg_mat', page: EncouterRegMatRoute.page),
        AutoRoute(path: '/maternal_service1', page: MaternalService1Route.page),
        AutoRoute(path: '/child_health1', page: ChildHealth1Route.page),
        AutoRoute(path: '/profile', page: ProfileRoute.page),
        AutoRoute(path: '/editProfileScreen', page: EditProfileRoute.page),
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
        AutoRoute(
            path: '/chip_referral1_screen', page: ChipReferral1Route.page),
        AutoRoute(
            path: '/chip_referral_form1_screen',
            page: ChipReferralForm1Route.page),

        AutoRoute(
            path: '/encounterRegHouse2Screen',
            page: EncounterRegHouse2Route.page),
        AutoRoute(
            path: '/encounterRegHouse3Screen',
            page: EncounterRegHouse3Route.page),
        AutoRoute(
            path: '/encounterRegHouse4Screen',
            page: EncounterRegHouse4Route.page),
        AutoRoute(
            path: '/encouterRegHouseRecordDetailsScreen',
            page: EncouterRegHouseRecordDetailsRoute.page),
        AutoRoute(
            path: '/encouterRegHouseRecord1Screen',
            page: EncouterRegHouseRecord1Route.page),

        AutoRoute(
            path: '/encouterRegHouseSchedule1Screen',
            page: EncouterRegHouseSchedule1Route.page),

        AutoRoute(
            path: '/encouterRegHoNewScheduleScreen',
            page: EncouterRegHoNewScheduleRoute.page),
        AutoRoute(
            path: '/maternalService2Screen', page: MaternalService2Route.page),
        AutoRoute(
            path: '/chipsReferralFormScreen',
            page: ChipsReferralFormRoute.page),

        AutoRoute(
            path: '/chipsReferralForm3Screen',
            page: ChipsReferralForm3Route.page),
        AutoRoute(path: '/referralForm4Screen', page: ReferralForm4Route.page),
        AutoRoute(
            path: '/chipsReferralListScreen',
            page: ChipsReferralListRoute.page),
        AutoRoute(
            path: '/houseHoldRegListScreen', page: HouseHoldRegListRoute.page),
        AutoRoute(path: '/houseHoldReg2Screen', page: HouseHoldReg2Route.page),
        AutoRoute(path: '/houseHoldReg3Screen', page: HouseHoldReg3Route.page),
        AutoRoute( path: '/forgot_password_screen', page: ForgotPasswordRoute.page),
     //   AutoRoute( path: '/more_screen', page: MoreRoute.page),
     //   AutoRoute( path: '/activity_screen', page: ActivityRoute.page),
        AutoRoute( path: '/offline_form1_screen', page: OfflineForm1Route.page),
        AutoRoute( path: '/offline_form2_screen', page: OfflineForm2Route.page),
     
      
          AutoRoute(
          path: '/dashboard',
          page: DashboardRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: 'home'),
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'offline', page: OfflineRoute.page),
            AutoRoute(path: 'activity', page: ActivityRoute.page),
           
            AutoRoute(path: 'more', page: MoreRoute.page),
          ],
        ),
      ];
}
