// import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';

class NativeAds extends StatefulWidget {
  final double? height;

  const NativeAds({Key? key, this.height}) : super(key: key);

  @override
  State<NativeAds> createState() => _NativeAdsState();
}

class _NativeAdsState extends State<NativeAds> {
  final adManager = Get.put(AdManager());

  @override
  void initState() {
    // TODO: implement initState
    Get.delete<AdManager>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => adManager.isNativeAdLoaded.value
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.black)),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 320,
                  minHeight: 320,
                  maxWidth: 400,
                  maxHeight: 350,
                ),
                child: AdWidget(ad: adManager.nativeAd!),
              ),
            ),
          )
        : const SizedBox());
  }
}
