class VideoResponseM {
  VideoResponseM({
      this.statusCode, 
      this.count, 
      this.videoData,});

  VideoResponseM.fromJson(dynamic json) {
    statusCode = json['status_code'];
    count = json['count'];
    if (json['data'] != null) {
      videoData = [];
      json['data'].forEach((v) {
        videoData?.add(VideoData.fromJson(v));
      });
    }
  }
  int? statusCode;
  int? count;
  List<VideoData>? videoData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['count'] = count;
    if (videoData != null) {
      map['data'] = videoData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class VideoData {
  VideoData({
      this.userImage, 
      this.userName, 
      this.video,});

  VideoData.fromJson(dynamic json) {
    userImage = json['user_image'];
    userName = json['user_name'];
    video = json['video'];
  }
  String? userImage;
  String? userName;
  String? video;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_image'] = userImage;
    map['user_name'] = userName;
    map['video'] = video;
    return map;
  }

}