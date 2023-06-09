import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_video_call_app/model/video_response_m.dart';
import 'package:random_video_call_app/screens/video_play/video_cnt.dart';
import 'package:random_video_call_app/utils/ad_manager.dart';
import 'package:random_video_call_app/utils/utils.dart';
import 'package:random_video_call_app/widgets/banner_ad.dart';
import 'package:random_video_call_app/widgets/loader_widget.dart';
import 'package:video_player/video_player.dart';

class RandomVideoPlayPage extends StatefulWidget {
  final List<VideoData>? data;
  final bool isArg;
  static const String route = '/randomVideoCall';

  const RandomVideoPlayPage({Key? key, this.data, this.isArg = true})
      : super(key: key);

  @override
  State<RandomVideoPlayPage> createState() => _RandomVideoPlayPageState();
}

class _RandomVideoPlayPageState extends State<RandomVideoPlayPage> {
  List<CameraDescription>? cameras;
  CameraController? cameraController;
  final cnt = Get.put(VideoDataCnt());

  AdManager adManager = Get.put(AdManager());

  @override
  void initState() {
    Get.delete<AdManager>();
    startCamera(cnt.direction.value);
    print('widget.isArg ${widget.isArg}');
    List<VideoData> data = widget.isArg ? Get.arguments : widget.data ?? [];
    data.shuffle();
    cnt.controller = VideoPlayerController.network('${data.first.video}')
      ..initialize().then((_) {
        setState(() {});
        cnt.controller?.play();
        cnt.controller?.setLooping(false);
        cnt.isLoading2.value = false;
        cnt.controller?.addListener(() {
          if (cnt.controller?.value.duration ==
              cnt.controller?.value.position) {
            if (adsData.randomVideoEnd ?? false) {
              adManager.loadGoogleInterAd(
                  flag: adsData.randomVideoEnd, onlyAd: true);
            }
            Get.back();
            super.initState();
          }
        });
      });
    super.initState();
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();
    cameraController = CameraController(
        cameras![direction], ResolutionPreset.high,
        enableAudio: false);
    await cameraController?.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {}); //To refresh widget
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController?.dispose();
    cnt.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController?.value.isInitialized ?? false) {
      return WillPopScope(
        onWillPop: () async {
          if (adsData.isInterShow12 ?? false) {
            adManager.loadGoogleInterAd(
              context: context,
              flag: adsData.isInterShow12,
            );
          } else {
            Get.back();
          }
          return false;
        },
        child: Scaffold(
          bottomNavigationBar: BannerAd(bannerShow: adsData.isBannerShow6),
          body: Obx(() => Stack(children: [
                    cnt.controller?.value.isInitialized ?? false
                        ? VideoPlayer(cnt.controller!)
                        : const ScreenLoader(),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 15),
                      child: InkWell(
                        onTap: () {
                          if (adsData.isInterShow12 ?? false) {
                            adManager.loadGoogleInterAd(
                              context: context,
                              flag: adsData.isInterShow12,
                            );
                          } else {
                            Get.back();
                          }
                        },
                        child: const CircleAvatar(
                          backgroundColor: ColorUtil.blackColor,
                          child: Icon(Icons.keyboard_backspace_rounded,
                              color: ColorUtil.whiteColor, size: 25),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            color: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox(
                                    width: 100,
                                    height: 150,
                                    child: CameraPreview(cameraController!)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    cnt.direction.value =
                                        cnt.direction.value == 0 ? 1 : 0;
                                    startCamera(cnt.direction.value);
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.black26,
                                    radius: 22,
                                    child: Icon(Icons.cameraswitch_outlined,
                                        color: ColorUtil.whiteColor, size: 25),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (adsData.isInterShow12 ?? false) {
                                      adManager.loadGoogleInterAd(
                                        context: context,
                                        flag: adsData.isInterShow12,
                                      );
                                    } else {
                                      Get.back();
                                    }
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 28,
                                    child: Icon(Icons.call_end,
                                        color: ColorUtil.whiteColor, size: 35),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    cnt.isAudio.value = !cnt.isAudio.value;
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black26,
                                    radius: 22,
                                    child: Icon(
                                        cnt.isAudio.value
                                            ? Icons.mic_off
                                            : Icons.mic,
                                        color: ColorUtil.whiteColor,
                                        size: 25),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])
              // : const ScreenLoader(message: 'Loading...'),
              ),
        ),
      );
    }
    return const SizedBox();
  }
}
