class AdResponseM {
  AdResponseM({
    this.status,
    this.adData,
    this.adsData,
  });

  AdResponseM.fromJson(dynamic json) {
    status = json['status'];
    adData = json['adData'] != null ? AdData.fromJson(json['adData']) : null;
    adsData =
        json['ads_data'] != null ? AdsData.fromJson(json['ads_data']) : null;
  }

  String? status;
  AdData? adData;
  AdsData? adsData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (adData != null) {
      map['adData'] = adData?.toJson();
    }
    if (adsData != null) {
      map['ads_data'] = adsData?.toJson();
    }
    return map;
  }
}

class AdsData {
  AdsData({
    this.id,
    this.hashTag,
    this.title,
    this.imageUrl,
    this.appUrl,
    this.btnVal,
  });

  AdsData.fromJson(dynamic json) {
    id = json['id'];
    hashTag = json['hash_tag'];
    title = json['title'];
    imageUrl = json['image_url'];
    appUrl = json['app_url'];
    btnVal = json['btn_val'];
  }

  String? id;
  String? hashTag;
  String? title;
  String? imageUrl;
  String? appUrl;
  String? btnVal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['hash_tag'] = hashTag;
    map['title'] = title;
    map['image_url'] = imageUrl;
    map['app_url'] = appUrl;
    map['btn_val'] = btnVal;
    return map;
  }
}

class AdData {
  AdData(
      {this.adsClickLimit,
      this.appVersion,
      this.isInterShow1,
      this.isInterShow2,
      this.isInterShow3,
      this.isInterShow4,
      this.isInterShow5,
      this.isInterShow6,
      this.isInterShow7,
      this.isInterShow8,
      this.isInterShow9,
      this.isInterShow10,
      this.isInterShow11,
      this.isInterShow12,
      this.isInterShow13,
      this.isSettingInterShow,
      this.isSettingBackInterShow,
      this.randomVideoEnd,
      this.isBannerShow1,
      this.isBannerShow2,
      this.isBannerShow3,
      this.isBannerShow4,
      this.isBannerShow5,
      this.isBannerShow6,
      this.isBannerShow7,
      this.isBannerShow8,
      this.isBannerShow9,
      this.isBannerShow10,
      this.openAdId,
      this.interAdId,
      this.nativeAdId,
      this.bannerAdId});

  AdData.fromJson(dynamic json) {
    adsClickLimit = json['adsClickLimit'];
    appVersion = json['app_version'];
    isInterShow1 = json['isInterShow1'];
    isInterShow2 = json['isInterShow2'];
    isInterShow3 = json['isInterShow3'];
    isInterShow4 = json['isInterShow4'];
    isInterShow5 = json['isInterShow5'];
    isInterShow6 = json['isInterShow6'];
    isInterShow7 = json['isInterShow7'];
    isInterShow8 = json['isInterShow8'];
    isInterShow9 = json['isInterShow9'];
    isInterShow10 = json['isInterShow10'];
    isInterShow11 = json['isInterShow11'];
    isInterShow12 = json['isInterShow12'];
    isInterShow13 = json['isInterShow13'];
    isSettingInterShow = json['isSettingInterShow'];
    isSettingBackInterShow = json['isSettingBackInterShow'];
    randomVideoEnd = json['random_video_end'];
    isBannerShow1 = json['isBannerShow1'];
    isBannerShow2 = json['isBannerShow2'];
    isBannerShow3 = json['isBannerShow3'];
    isBannerShow4 = json['isBannerShow4'];
    isBannerShow5 = json['isBannerShow5'];
    isBannerShow6 = json['isBannerShow6'];
    isBannerShow7 = json['isBannerShow7'];
    isBannerShow8 = json['isBannerShow8'];
    isBannerShow9 = json['isBannerShow9'];
    isBannerShow10 = json['isBannerShow10'];
    openAdId = json['open_google_ad_id'];
    interAdId = json['inter_google_ad_id'];
    nativeAdId = json['native_google_ad_id'];
    bannerAdId = json['banner_google_ad_id'];
  }

  String? adsClickLimit;
  String? appVersion;
  bool? isInterShow1;
  bool? isInterShow2;
  bool? isInterShow3;
  bool? isInterShow4;
  bool? isInterShow5;
  bool? isInterShow6;
  bool? isInterShow7;
  bool? isInterShow8;
  bool? isInterShow9;
  bool? isInterShow10;
  bool? isInterShow11;
  bool? isInterShow12;
  bool? isInterShow13;
  bool? isSettingInterShow;
  bool? isSettingBackInterShow;
  bool? randomVideoEnd;
  bool? isBannerShow1;
  bool? isBannerShow2;
  bool? isBannerShow3;
  bool? isBannerShow4;
  bool? isBannerShow5;
  bool? isBannerShow6;
  bool? isBannerShow7;
  bool? isBannerShow8;
  bool? isBannerShow9;
  bool? isBannerShow10;
  String? openAdId;
  String? interAdId;
  String? nativeAdId;
  String? bannerAdId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adsClickLimit'] = adsClickLimit;
    map['app_version'] = appVersion;
    map['isInterShow1'] = isInterShow1;
    map['isInterShow2'] = isInterShow2;
    map['isInterShow3'] = isInterShow3;
    map['isInterShow4'] = isInterShow4;
    map['isInterShow5'] = isInterShow5;
    map['isInterShow6'] = isInterShow6;
    map['isInterShow7'] = isInterShow7;
    map['isInterShow8'] = isInterShow8;
    map['isInterShow9'] = isInterShow9;
    map['isInterShow10'] = isInterShow10;
    map['isInterShow11'] = isInterShow11;
    map['isInterShow12'] = isInterShow12;
    map['isInterShow13'] = isInterShow13;
    map['isSettingInterShow'] = isSettingInterShow;
    map['isSettingBackInterShow'] = isSettingBackInterShow;
    map['random_video_end'] = randomVideoEnd;
    map['isBannerShow1'] = isBannerShow1;
    map['isBannerShow2'] = isBannerShow2;
    map['isBannerShow3'] = isBannerShow3;
    map['isBannerShow4'] = isBannerShow4;
    map['isBannerShow5'] = isBannerShow5;
    map['isBannerShow6'] = isBannerShow6;
    map['isBannerShow7'] = isBannerShow7;
    map['isBannerShow8'] = isBannerShow8;
    map['isBannerShow9'] = isBannerShow9;
    map['isBannerShow10'] = isBannerShow10;
    map['open_google_ad_id'] = openAdId;
    map['inter_google_ad_id'] = interAdId;
    map['native_google_ad_id'] = nativeAdId;
    map['banner_google_ad_id'] = bannerAdId;
    return map;
  }
}
