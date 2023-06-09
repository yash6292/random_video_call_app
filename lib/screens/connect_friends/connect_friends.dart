import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_video_call_app/screens/video_play/video_cnt.dart';
import 'package:random_video_call_app/screens/video_play/random_video_play.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';
import 'package:random_video_call_app/utils/color_utils.dart';
import 'package:random_video_call_app/widgets/banner_ad.dart';
import 'package:random_video_call_app/widgets/button.dart';
import 'package:random_video_call_app/widgets/native_ads.dart';

class ConnectFriendsScreen extends StatefulWidget {
  static const String route = '/searchFriend';

  const ConnectFriendsScreen({Key? key}) : super(key: key);

  @override
  State<ConnectFriendsScreen> createState() => _ConnectFriendsScreenState();
}

class _ConnectFriendsScreenState extends State<ConnectFriendsScreen> {
  final cnt = Get.put(VideoDataCnt());
  AdManager adManager = Get.put(AdManager());

  @override
  void initState() {
    // TODO: implement initState
    cameraPer();
    super.initState();
  }

  cameraPer() async {
    await Permission.camera.isDenied
        .then((value) => Permission.camera.request());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (adsData.isInterShow11 ?? false) {
          adManager.loadGoogleInterAd(
            context: context,
            flag: adsData.isInterShow11,
          );
        } else {
          Get.back();
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Find Stranger People",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            leading: InkWell(
              child: const Icon(Icons.keyboard_backspace_rounded,
                  color: ColorUtil.blackColor, size: 30),
              onTap: () {
                if (adsData.isInterShow11 ?? false) {
                  adManager.loadGoogleInterAd(
                    context: context,
                    flag: adsData.isInterShow11,
                  );
                } else {
                  Get.back();
                }
              },
            )),
        bottomNavigationBar: BannerAd(bannerShow: adsData.isBannerShow5),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                const Spacer(),
                const NativeAds(),
                const Spacer(),
                const SizedBox(height: 30),
                Button(
                    width: 150,
                    title: 'Connect',
                    onTap: () {
                      Get.delete<AdManager>();
                      if (adsData.isInterShow10 ?? false) {
                        adManager.loadGoogleInterAd(
                            context: context,
                            flag: adsData.isInterShow10,
                            isBack: false,
                            screen: RandomVideoPlayPage(
                                data: cnt.videoResponseM.value.videoData ?? [],
                                isArg: false));
                      } else {
                        Get.toNamed(RandomVideoPlayPage.route,
                            arguments: cnt.videoResponseM.value.videoData);
                      }
                    }),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
