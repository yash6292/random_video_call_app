import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_video_call_app/screens/age/age_selection.dart';
import 'package:random_video_call_app/screens/country/country_select_cnt.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';
import 'package:random_video_call_app/utils/preferences/preference_manager.dart';
import 'package:random_video_call_app/utils/preferences/preferences_key.dart';
import 'package:random_video_call_app/utils/utils.dart';
import 'package:random_video_call_app/widgets/banner_ad.dart';
import 'package:random_video_call_app/widgets/button.dart';
import 'package:random_video_call_app/widgets/native_ads.dart';

class GenderSelect extends StatefulWidget {
  static const String route = '/gender_select';

  const GenderSelect({Key? key}) : super(key: key);

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  final cnt = Get.put(CountryCnt());
  String name = AppPreference().getString(PreferencesKey.userName);
  List gender = ['Boy', 'Girl'];
  List image = ['assets/boys.png', 'assets/girl.png'];
  AdManager adManager = Get.put(AdManager());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (adsData.isInterShow3 ?? false) {
            adManager.loadGoogleInterAd(
              context: context,
              flag: adsData.isInterShow3,
            );
          } else {
            Get.back();
          }
          return false;
        },
        child: Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: 0.h,
                      left: 20.w,
                      right: 20.w,
                      bottom: adsData.isBannerShow2 ?? false ? 5.h : 60.h),
                  child: Button(
                      onTap: () {
                        if (cnt.index == -1) {
                          Get.rawSnackbar(
                              message: "Please Select Your Gender",
                              backgroundColor: Colors.red,
                              snackPosition: SnackPosition.BOTTOM,
                              borderRadius: 99.r,
                              duration: const Duration(seconds: 3),
                              margin: EdgeInsets.only(
                                  bottom: 60.h,
                                  left: 20.w,
                                  right: 20.w,
                                  top: 10.h));
                        } else {
                          Get.delete<AdManager>();
                          if (adsData.isInterShow2 ?? false) {
                            adManager.loadGoogleInterAd(
                                context: context,
                                flag: adsData.isInterShow2,
                                isBack: false,
                                screen: const AgeSelection());
                          } else {
                            Get.toNamed(AgeSelection.route);
                          }
                        }
                      },
                      title: 'Next')),
              BannerAd(bannerShow: adsData.isBannerShow2),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: const NativeAds(),
                    ),
                    SizedBox(height: 8.h),
                    Text('What is your gender?',
                        style: FontStyleUtilities.h6(
                          fontColor: ColorUtil.blackColor.withOpacity(0.4),
                        ).copyWith(letterSpacing: 0.2)),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 185,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: gender.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => setState(() {
                              cnt.index = index;
                            }),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                      radius: 60,
                                      backgroundColor: cnt.index == index
                                          ? ColorUtil.blackColor
                                          : ColorUtil.blackColor.withOpacity(0.4),
                                      backgroundImage: AssetImage(image[index])),
                                  SizedBox(height: 8.h),
                                  Text(gender[index],
                                      style: FontStyleUtilities.h4(
                                          fontColor: cnt.index == index
                                              ? ColorUtil.blackColor
                                              : ColorUtil.blackColor
                                                  .withOpacity(0.4))),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
