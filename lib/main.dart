import 'package:demo_app/core/router/locator.dart';
import 'package:demo_app/core/router/router.dart';
import 'package:demo_app/core/storage_service.dart';
import 'package:demo_app/core/theme/new_theme/app_theme.dart';
import 'package:demo_app/feature/chip_referral/provider/chip_referral_binding.dart';
import 'package:demo_app/feature/encounter_reg_house/provider/encouter_reg_house_binding.dart';
import 'package:demo_app/feature/encouter_reg_mat/provider/encouter_reg_mat_binding.dart';
import 'package:demo_app/feature/home/provider/home_binding.dart';
import 'package:demo_app/feature/house_hold_reg/provider/house_hold_reg_binding.dart';
import 'package:demo_app/feature/login/provider/login_binding.dart';
import 'package:demo_app/feature/profile/provider/profile_binding.dart';
import 'package:demo_app/feature/wallet/provider/wallet_binding.dart';
import 'package:demo_app/network/network_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await initialize();
  await initServices();
  await ScreenUtil.ensureScreenSize();
  Future.delayed(const Duration(seconds: 4), () {
    // FlutterNativeSplash.remove();
  });
  HomeBindings().dependencies();
  LoginBindings().dependencies();
  WalletBinding().dependencies();
  ProfileBinding().dependencies();
  EncouterRegHouseBinding().dependencies();
  EncouterRegMatBinding().dependencies();
  HouseHoldRegBinding().dependencies();
  ChipReferralBinding().dependencies();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> initServices() async {
  await GetStorage.init();
  inilizeLocator();
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<GetMaterialController>(GetMaterialController());
  await Get.putAsync<NetworkService>(() => NetworkService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final appRouter = getIt<AppRouter>();
      ScreenUtil.init(context);
      // final state = ref.watch(themeProvider);
      return MaterialApp.router(
        title: 'Book Keeping App',
        debugShowCheckedModeBanner: false,
        // theme: themeData(state.theme!),
        theme: AppTheme.light,
        // 3. Provide dark theme.
        //darkTheme: AppTheme.dark,
        // themeMode: state.theme,

        routerConfig: appRouter.config(),
      );
    });
  }
}


//}/transaction/fetch-transactions?filter_by=date_range&start_date=&end_date=
 