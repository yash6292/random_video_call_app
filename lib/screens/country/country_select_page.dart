import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:random_video_call_app/screens/category/category.dart';
import 'package:random_video_call_app/screens/country/country_select_cnt.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';
import 'package:random_video_call_app/utils/utils.dart';
import 'package:random_video_call_app/widgets/banner_ad.dart';
import 'package:random_video_call_app/widgets/button.dart';
import 'package:random_video_call_app/widgets/loader_widget.dart';

class CountrySelectPage extends StatefulWidget {
  static const String route = '/user/country';

  const CountrySelectPage({Key? key}) : super(key: key);

  @override
  State<CountrySelectPage> createState() => _CountrySelectPageState();
}

class _CountrySelectPageState extends State<CountrySelectPage> {
  final cnt = Get.put(CountryCnt());
  AdManager adManager = Get.put(AdManager());

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
        onWillPop: () async {
          if (adsData.isInterShow7 ?? false) {
            adManager.loadGoogleInterAd(
              context: context,
              flag: adsData.isInterShow7,
            );
          } else {
            Get.back();
          }
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Select your country",
                style: FontStyleUtilities.h3(
                    fontColor: ColorUtil.blackColor, fontWeight: FWT.bold)),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              cnt.isLoading.value
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical:
                              adsData.isBannerShow3 ?? false ? 5.h : 20.h),
                      child: Button(
                          onTap: () {
                            if (cnt.selected == -1) {
                              Get.rawSnackbar(
                                  message: "Please Select your country",
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
                              if (adsData.isInterShow6 ?? false) {
                                adManager.loadGoogleInterAd(
                                    context: context,
                                    flag: adsData.isInterShow6,
                                    isBack: false,
                                    screen: const CategoryPage());
                              } else {
                                Get.toNamed(CategoryPage.route);
                              }
                            }
                          },
                          title: 'Next')),
              // SizedBox( height: adsData.isBannerShow2 ?? false ? 5.h :  30.h),
              cnt.isLoading.value
                  ? const SizedBox.shrink()
                  : BannerAd(bannerShow: adsData.isBannerShow3),
            ],
          ),
          body: cnt.isLoading.value
              ? const ScreenLoader()
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cnt.countryResponseM.value.data?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    cnt.selected = index;
                                  });
                                },
                                child: Container(
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                      color: cnt.selected == index
                                          ? ColorUtil.primaryColor
                                              .withOpacity(0.7)
                                          : ColorUtil.whiteColor,
                                      border: Border.all(
                                          color: cnt.selected != index
                                              ? ColorUtil.primaryColor
                                              : Colors.transparent),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Row(
                                      children: [
                                        SvgPicture.network(
                                          '${cnt.countryResponseM.value.data?[index].image}',
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.cover,
                                          placeholderBuilder:
                                              (BuildContext context) =>
                                                  const SizedBox.shrink(),
                                        ),
                                        SizedBox(
                                            width:
                                                cnt.isLoading.value ? 0 : 22.w),
                                        Flexible(
                                          child: Text(
                                            '${cnt.countryResponseM.value.data?[index].name}',
                                            style: FontStyleUtilities.h4(
                                                fontWeight: FWT.regular,
                                                fontColor: cnt.selected == index
                                                    ? ColorUtil.whiteColor
                                                    : ColorUtil.blackColor),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        )));
  }
}
