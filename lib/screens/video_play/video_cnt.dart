import 'package:get/get.dart';
import 'package:random_video_call_app/model/video_response_m.dart';
import 'package:random_video_call_app/utils/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:video_player/video_player.dart';

class VideoDataCnt extends GetxController {
  final dio = Dio();
  Rx<VideoResponseM> videoResponseM = VideoResponseM().obs;
  RxBool isLoading = true.obs;
  RxBool isLoading2 = false.obs;
  RxBool isVideoStop = false.obs;
  RxBool isAudio = false.obs;
  RxInt direction = 1.obs;
  Rx<VideoData> data = VideoData().obs;
  VideoPlayerController? controller;

  @override
  void onInit() {
    super.onInit();
    getVideoData();
  }

  Future<void> getVideoData() async {
    try {
      isLoading.value = true;
      var response = await dio.get(ApiRoutes.videos);
      if (response.statusCode == 200) {
        videoResponseM.value = VideoResponseM.fromJson(response.data);
      }
      isLoading.value = false;
    } catch (error) {
      print("errorerror $error");
      isLoading.value = false;
    }
  }
}
