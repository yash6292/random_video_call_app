import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';
import 'package:random_video_call_app/widgets/launch_url.dart';
import 'package:share_plus/share_plus.dart';

String appUrl =
    'https://play.google.com/store/apps/details?id=com.videocall.randomvideocall';

String websiteUrl = 'https://amdavadiinfotech1234.blogspot.com/';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  AdManager adManager = Get.put(AdManager());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              SizedBox(height: 20.h),
              Image.asset(
                'assets/icon.png',
                width: 120.0.w,
                height: 120.0.h,
              ),
              SizedBox(height: 15.h),
              Text('Random Video Call',
                  style: TextStyle(fontSize: 22.sp, color: Colors.white)),SizedBox(height: 10.h),
              Text('Version :${adsData.appVersion}',
                  style: TextStyle(fontSize: 13.sp, color: Colors.white)),
              SizedBox(height: 15.h),
              const Divider(color: Colors.white),
              SizedBox(height: 15.h),
              draweTile(
                  icon: Icons.security_rounded,
                  text: 'Privacy Policy',
                  onTap: () {
                    launchUrl(websiteUrl);
                  }),
              draweTile(
                  icon: Icons.privacy_tip_sharp,
                  text: 'Terms And Condition',
                  onTap: () {
                    launchUrl(websiteUrl);
                  }),
              // draweTile(
              //     icon: Icons.favorite,
              //     text: 'Favourite Movies',
              //     onTap: () => Get.offAll(const FavoriteMoviesPage())),
              draweTile(
                  icon: Icons.share,
                  text: 'Share App',
                  onTap: () {
                    Share.share(
                        "Download this Random Video Call: Live Chat on Play Store $appUrl");
                  }),
              draweTile(
                  icon: Icons.star,
                  text: 'Rate App',
                  onTap: () {
                    launchUrl(appUrl);
                  }),
              draweTile(
                  icon: Icons.apps,
                  text: 'More Apps',
                  onTap: () {
                    launchUrl(
                        'https://play.google.com/store/apps/developer?id=Amdavadi+Infotech');
                  }),
              const Spacer(),
              DefaultTextStyle(
                  style: TextStyle(fontSize: 12.sp, color: Colors.white54),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16.0.h),
                    child: const Text('Terms of Service | Privacy Policy'),
                  ))
            ])));
  }

  ListTile draweTile({String? text, IconData? icon, Function()? onTap}) {
    return ListTile(
        horizontalTitleGap: 10,
        leading: Icon(icon),
        title: Text(text ?? ''),
        onTap: onTap);
  }
}
