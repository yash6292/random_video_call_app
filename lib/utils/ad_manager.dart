import 'dart:convert';
import 'dart:math';

// import 'package:applovin_max/applovin_max.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:random_video_call_app/main.dart';
import 'package:random_video_call_app/model/ad_response_m.dart';
import 'package:random_video_call_app/utils/api_constants.dart';
import 'package:random_video_call_app/utils/preferences/preference_manager.dart';

AdData adsData = AdData();
int addLimit = 0;

class AdManager extends GetxController {
  final dio = Dio();

  String? adUnitId;

  RxBool isLoading = false.obs;

  BannerAd? bannerAd;
  AppOpenAd? appOpenAd;
  InterstitialAd? interstitialAd;
  NativeAd? nativeAd;

  RxBool isNativeAdLoaded = false.obs;
  RxBool isInterLoading = false.obs;

  AdManager({this.adUnitId});

  @override
  void onInit() {
    // TODO: implement onInit
    loadGoogleNativeAd();
    loadGoogleBannerAd();
    super.onInit();
  }

  Future<void> getAdData() async {
    try {
      isLoading.value = true;
      var response = await dio.get(ApiRoutes.adsApi);
      if (response.statusCode == 200) {
        AdData adData = AdData.fromJson(response.data['data']);
        adsData = adData;
        addLimit = int.parse(adData.adsClickLimit!);
      }
      isLoading.value = false;
    } catch (e) {
      print('errerr $e');
      isLoading.value = false;
    }
  }

  void loadGoogleOpenAd() {
    AppOpenAd.load(
      request: const AdRequest(),
      adUnitId: "${adsData.openAdId}",
      orientation: AppOpenAd.orientationPortrait,
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;
          appOpenAd?.show();
        },
        onAdFailedToLoad: (error) {
          print('AppOpenAd failed to load: $error');
          // Handle the error.
        },
      ),
    );
  }

  void loadGoogleInterAd(
      {bool? flag,
      bool onlyAd = false,
      BuildContext? context,
      Widget? screen,
      bool isBack = true}) {
    if (flag ?? true) {
      InterstitialAd.load(
          adUnitId: "${adsData.interAdId}",
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad) {
              interstitialAd = ad;
              interstitialAd!.show();
              interstitialAd!.fullScreenContentCallback =
                  FullScreenContentCallback(
                      onAdFailedToShowFullScreenContent: ((ad, error) {
                ad.dispose();
                interstitialAd!.dispose();
                print(error.message);
              }), onAdDismissedFullScreenContent: (ad) {
                if (onlyAd) {
                  ad.dispose();
                  interstitialAd!.dispose();
                } else {
                  ad.dispose();
                  interstitialAd!.dispose();
                  if (isBack) {
                    Navigator.of(context!).pop();
                  } else {
                    Navigator.push(context!, MaterialPageRoute(builder: (_) {
                      return screen!;
                    }));
                  }
                }
              });
            },
            onAdFailedToLoad: (err) {
              print(err.message);
            },
          ));
    }
  }

  void loadGoogleNativeAd() {
    nativeAd = NativeAd(
        adUnitId: "${adsData.nativeAdId}",
        factoryId: "listTileMedium",
        listener: NativeAdListener(onAdLoaded: (ad) {
          isNativeAdLoaded.value = true;
        }, onAdFailedToLoad: (ad, error) {
          isNativeAdLoaded.value = false;
          nativeAd?.dispose();
        }),
        request: const AdRequest(),
        nativeTemplateStyle: NativeTemplateStyle(
            templateType: TemplateType.medium,
            mainBackgroundColor: Colors.white,
            cornerRadius: 10.0))
      ..load();
  }

  void loadGoogleBannerAd() {
    bannerAd = BannerAd(
      adUnitId: "${adsData.bannerAdId}",
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isLoading.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          isLoading.value = false;
          ad.dispose();
        },
      ),
    )..load();
  }
}
