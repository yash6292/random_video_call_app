// import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';

class BannerAd extends StatefulWidget {
  final bool? bannerFlag;
  final bool? bannerShow;

  const BannerAd({Key? key, this.bannerFlag, this.bannerShow})
      : super(key: key);

  @override
  State<BannerAd> createState() => _BannerAdState();
}

class _BannerAdState extends State<BannerAd> {
  final adManager = Get.put(AdManager());

  @override
  void initState() {
    // TODO: implement initState
    Get.delete<AdManager>();
    super.initState( );
  }

  @override
  Widget build(BuildContext context) {
    return widget.bannerShow ?? false
        ? SizedBox(
            width: adManager.bannerAd?.size.width.toDouble(),
            height: adManager.bannerAd?.size.height.toDouble(),
            child: AdWidget(ad: adManager.bannerAd!),
          )
        : const SizedBox.shrink();
  }
}
