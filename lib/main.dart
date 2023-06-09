import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:random_video_call_app/constants/pages.dart';
import 'package:random_video_call_app/constants/routes.dart';
import 'package:random_video_call_app/screens/splash/splash.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_video_call_app/utils/app_life_cycle.dart';
import 'package:random_video_call_app/utils/utils.dart';
import 'utils/preferences/preference_manager.dart';

//bfef5e5c-704b-48af-968a-295b9ecd1534 - one signal

bool isInitialized = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  await AppPreference().initialAppPreference();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("a5155fd7-7503-4cae-9ba5-81820e7dc29c");

  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

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
