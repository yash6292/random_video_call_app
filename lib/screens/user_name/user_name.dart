import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:random_video_call_app/screens/country/country_select_page.dart';
import 'package:random_video_call_app/screens/gender/gender.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';
import 'package:random_video_call_app/utils/preferences/preference_manager.dart';
import 'package:random_video_call_app/utils/preferences/preferences_key.dart';
import 'package:random_video_call_app/utils/utils.dart';
import 'package:random_video_call_app/widgets/banner_ad.dart';
import 'package:random_video_call_app/widgets/button.dart';
import 'package:random_video_call_app/widgets/exit_dialog.dart';
import 'package:random_video_call_app/widgets/text_field.dart';

class UserName extends StatefulWidget {
  static const String route = '/username';

  const UserName({Key? key}) : super(key: key);

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  final formGlobalKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  AdManager adManager = Get.put(AdManager());

  @override
  void initState() {
    // TODO: implement initState
    adManager.loadGoogleOpenAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          showExitPopup(context);
          return false;
        },
        child: Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 10.h),
                child: Button(
                  onTap: () {
                    if (formGlobalKey.currentState!.validate()) {
                      Get.delete<AdManager>();
                      if (adsData.isInterShow1 ?? false) {
                        adManager.loadGoogleInterAd(
                            context: context,
                            flag: adsData.isInterShow1,
                            isBack: false,
                            screen: const GenderSelect());
                      } else {
                        Get.toNamed(GenderSelect.route);
                      }
                    }
                  },
                  title: 'Next',
                  style: FontStyleUtilities.h4(fontColor: ColorUtil.whiteColor),
                ),
              ),
              BannerAd(bannerShow: adsData.isBannerShow1),
            ],
          ),
          body: Form(
            key: formGlobalKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    Image.asset('assets/girl_pen.gif'),
                    // SvgPicture.asset('assets/welcome.svg', height: 300.h),
                    SizedBox(height: 20.h),
                    Center(
                      child: Text("What is your name?",
                          style: FontStyleUtilities.h4(
                              fontColor: ColorUtil.primaryColor)),
                    ),
                    SizedBox(height: 40.h),
                    Text("Enter your name",
                        style: FontStyleUtilities.p1(
                            fontColor: ColorUtil.blackColor)),
                    SizedBox(height: 10.h),
                    SizedBox(
                        height: 70,
                        child: MyTextField(
                          controller: name,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                          hint: "Marcus Yori",
                        )),
                    // const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
