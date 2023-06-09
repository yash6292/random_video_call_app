import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_video_call_app/screens/category/custom_drawer.dart';
import 'package:random_video_call_app/screens/connect_friends/connect_friends.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';
import 'package:random_video_call_app/utils/color_utils.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:random_video_call_app/widgets/native_ads.dart';

class CategoryPage extends StatefulWidget {
  static const String route = '/category';

  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  AdManager adManager = Get.put(AdManager());
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdropColor: Colors.black,
        controller: _advancedDrawerController,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        drawer: CustomDrawer(),
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: WillPopScope(
          onWillPop: () async {
            if (adsData.isInterShow9 ?? false) {
              adManager.loadGoogleInterAd(
                context: context,
                flag: adsData.isInterShow9,
              );
            } else {
              Get.back();
            }
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => _advancedDrawerController.showDrawer(),
                    child: ValueListenableBuilder<AdvancedDrawerValue>(
                        valueListenable: _advancedDrawerController,
                        builder: (_, value, __) {
                          return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              child: Icon(
                                  value.visible ? Icons.clear : Icons.menu,
                                  color: ColorUtil.blackColor,
                                  key: ValueKey<bool>(value.visible)));
                        }),
                  ),
                  const Spacer(),
                  RichText(
                      text: const TextSpan(
                          // set the default style for the children TextSpans
                          style: TextStyle(fontSize: 20),
                          children: [
                        TextSpan(
                            text: 'Random ',
                            style: TextStyle(
                                fontFamily: 'Josefin Sans',
                                color: Color(0xffb41004),
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'Video Call',
                            style: TextStyle(
                                color: Color(0xff025007),
                                fontFamily: 'Josefin Sans',
                                fontWeight: FontWeight.bold)),
                      ])),
                  const Spacer(),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonContainer(
                          title: 'Random Video Call',
                          onTap: () {
                            Get.delete<AdManager>();
                            if (adsData.isInterShow8 ?? false) {
                              adManager.loadGoogleInterAd(
                                  context: context,
                                  flag: adsData.isInterShow8,
                                  isBack: false,
                                  screen: const ConnectFriendsScreen());
                            } else {
                              Get.toNamed(ConnectFriendsScreen.route);
                            }
                          },
                          image: 'assets/girl1.png',
                          subTitle: 'Free To Used Best Video Call',
                          color1: const Color(0xff025007),
                          color2: const Color(0xff026508),
                          color3: Colors.green),
                      SizedBox(height: 15.h),
                      CommonContainer(
                          title: 'Global Video Call',
                          onTap: () {
                            Get.delete<AdManager>();
                            if (adsData.isInterShow8 ?? false) {
                              adManager.loadGoogleInterAd(
                                  context: context,
                                  flag: adsData.isInterShow8,
                                  isBack: false,
                                  screen: const ConnectFriendsScreen());
                            } else {
                              Get.toNamed(ConnectFriendsScreen.route);
                            }
                          },
                          image: 'assets/girl3.png',
                          subTitle: 'Global Live Video Call All World',
                          color1: const Color(0xffff1403),
                          color2: const Color(0xffb70e13),
                          color3: const Color(0xffD51818)),
                      SizedBox(height: 30.h),
                      const NativeAds(),
                      SizedBox(height: 20.h),
                    ]),
              ),
            ),
          ),
        ));
  }
}

class CircleIconItem extends StatelessWidget {
  final IconData icon;
  final String? title;
  final Color? color;

  const CircleIconItem({Key? key, required this.icon, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(
        radius: 25,
        backgroundColor: color,
        child: Center(child: Icon(icon, color: ColorUtil.whiteColor)),
      ),
      SizedBox(height: 8.h),
      Text(title ?? '')
    ]);
  }
}

class CommonContainer extends StatelessWidget {
  final Function()? onTap;
  final Color? color1;
  final Color? color2;
  final Color? color3;
  final String? title;
  final String? subTitle;
  final String? image;

  const CommonContainer({
    Key? key,
    this.onTap,
    this.color1,
    this.color2,
    this.color3,
    this.title,
    this.subTitle,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 120,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [color1!, color2!, color3!]),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title ?? '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 5.h),
                  Text(subTitle ?? '',
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 14)),
                  SizedBox(height: 10.h),
                  Container(
                      height: 30,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(99.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Call Now',
                              style: TextStyle(
                                  color: ColorUtil.whiteColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(width: 8.w),
                          const Icon(Icons.video_call_rounded,
                              color: ColorUtil.whiteColor)
                        ],
                      ))
                ],
              ),
            ),
            Positioned(
              right: 5,
              top: 0,
              child: Image.asset(
                image ?? '',
                fit: BoxFit.cover,
                height: 120,
              ),
            )
          ],
        ),
      ),
    );
  }
}
