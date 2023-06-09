// import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:random_video_call_app/constants/pages.dart';
import 'package:random_video_call_app/constants/routes.dart';
import 'package:random_video_call_app/screens/splash/splash.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';
import 'package:random_video_call_app/utils/app_life_cycle.dart';
import 'package:random_video_call_app/utils/utils.dart';
import 'utils/preferences/preference_manager.dart';

//bfef5e5c-704b-48af-968a-295b9ecd1534 - one signal

bool isInitialized = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("bfef5e5c-704b-48af-968a-295b9ecd1534");

  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {});
  await AppPreference().initialAppPreference();
  // bool? isInit = await AppLovinMAX.isInitialized();
  // if (isInit == false) {
  //   Map? sdkConfiguration = await AppLovinMAX.initialize(
  //       "Q_cr6fliNUamttEd0C3551xaSq3EpCax_LNncR_-50RbWkKThWsJtG37u2gAfu6TUOdBoXhqMQ9_xxMR4JBUcO");
  //   if (sdkConfiguration != null) {
  //     isInitialized = true;
  //     AppPreference().setBool("sdk", true);
  //   }
  // }
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppLifecycleReactor appLifecycleReactor = AppLifecycleReactor();
  bool isPaused = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appLifecycleReactor.listenToAppStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        navigatorKey: Get.key,
        title: 'Random Video Call App',
        initialRoute: SplashScreen.route,
        routes: routes,
        getPages: getPages,
      ),
    );
  }
}
