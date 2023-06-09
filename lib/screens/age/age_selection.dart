import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_video_call_app/screens/category/category.dart';
import 'package:random_video_call_app/screens/country/country_select_cnt.dart';
import 'package:random_video_call_app/screens/country/country_select_page.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';
import 'package:random_video_call_app/utils/color_utils.dart';
import 'package:random_video_call_app/utils/font_style.dart';
import 'package:random_video_call_app/widgets/banner_ad.dart';
import 'package:random_video_call_app/widgets/button.dart';

class AgeSelection extends StatefulWidget {
  static const String route = '/user/age';

  const AgeSelection({Key? key}) : super(key: key);

  @override
  State<AgeSelection> createState() => _AgeSelectionState();
}

class _AgeSelectionState extends State<AgeSelection> {
  int selected = 18;
  List age = [
    'Under 18',
    '18-24',
    '25-34',
    '35-44',
    '45-54',
    '55-64',
    'More than 65'
  ];
  final countrySelectCnt = Get.put(CountryCnt());
  AdManager adManager = Get.put(AdManager());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (adsData.isInterShow5 ?? false) {
            adManager.loadGoogleInterAd(
              context: context,
              flag: adsData.isInterShow5,
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
                      left: 20.w,
                      right: 20.w,
                      bottom: adsData.isBannerShow3 ?? false ? 5.h : 50.h),
                  child: Button(
                      onTap: () {
                        if (countrySelectCnt.age == -1) {
                          Get.rawSnackbar(
                              message: "Please Select your age",
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
                          if (adsData.isInterShow4 ?? false) {
                            adManager.loadGoogleInterAd(
                                context: context,
                                flag: adsData.isInterShow4,
                                isBack: false,
                                screen: const CountrySelectPage());
                          } else {
                            Get.toNamed(CountrySelectPage.route);
                          }
                        }
                      },
                      title: 'Next')),
              BannerAd(bannerShow: adsData.isBannerShow3),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Center(
                    child: Text("Which age group are you in?",textAlign: TextAlign.center,
                        style: FontStyleUtilities.h3(
                            fontColor: ColorUtil.blackColor,
                            fontWeight: FWT.bold)),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: ListView.separated(
                        itemCount: age.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => setState(() {
                            countrySelectCnt.age = index;
                          }),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: countrySelectCnt.age == index
                                    ? ColorUtil.primaryColor.withOpacity(0.2)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: countrySelectCnt.age == index
                                        ? ColorUtil.primaryColor
                                        : Colors.grey,
                                    width: 2)),
                            child: Text(
                              age[index],
                              style: TextStyle(
                                  color: countrySelectCnt.age == index
                                      ? ColorUtil.primaryColor
                                      : Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20.h,
                        ),
                      ),
                    ),
                  ),
                  // const Spacer(),
                ],
              ),
            ),
          ),
        ));
  }
}
