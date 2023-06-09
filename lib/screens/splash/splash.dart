import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_call_app/Utils/color_utils.dart';
import 'package:random_video_call_app/screens/user_name/user_name.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AdManager adManager = Get.put(AdManager());

  @override
  void initState() {
    adManager.getAdData();
    super.initState();
    Get.delete<AdManager>();
    Future.delayed(
        const Duration(seconds: 5), () => Get.offNamed(UserName.route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Image.asset(
            'assets/splashBg.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, ColorUtil.blackColor],
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Center(
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                            color: ColorUtil.whiteColor),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Random Video Call',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorUtil.whiteColor)),
                    SizedBox(height: 40),
                  ],
                )),
          )
        ],
      ),
    ));
  }
}
