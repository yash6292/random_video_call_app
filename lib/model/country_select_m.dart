class CountrySelectM {
  CountrySelectM({
      this.status, 
      this.info,});

  CountrySelectM.fromJson(dynamic json) {
    status = json['status'];
    if (json['info'] != null) {
      info = [];
      json['info'].forEach((v) {
        info?.add(Info.fromJson(v));
      });
    }
  }
  int? status;
  List<Info>? info;
CountrySelectM copyWith({  int? status,
  List<Info>? info,
}) => CountrySelectM(  status: status ?? this.status,
  info: info ?? this.info,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (info != null) {
      map['info'] = info?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Info {
  Info({
      this.countryId, 
      this.countryName, 
      this.flag,
      this.bgImage, 
      this.userImage,});

  Info.fromJson(dynamic json) {
    countryId = json['country_id'];
    countryName = json['country_name'];
    flag = json['flag'];
    bgImage = json['bg_image'];
    userImage = json['user_image'];
  }
  String? countryId;
  String? countryName;
  String? flag;
  String? bgImage;
  String? userImage;
Info copyWith({  String? countryId,
  String? countryName,
  String? flag,
  String? bgImage,
  String? userImage,
}) => Info(  countryId: countryId ?? this.countryId,
  countryName: countryName ?? this.countryName,
  flag: flag ?? this.flag,
  bgImage: bgImage ?? this.bgImage,
  userImage: userImage ?? this.userImage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = countryId;
    map['country_name'] = countryName;
    map['flag'] = flag;
    map['bg_image'] = bgImage;
    map['user_image'] = userImage;
    return map;
  }

}