class CountryResponseM {
  CountryResponseM({this.status, this.data});

  CountryResponseM.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  String? status;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.name,
    this.code,
    this.emoji,
    this.unicode,
    this.image,
  });

  Data.fromJson(dynamic json) {
    name = json['name'];
    code = json['code'];
    emoji = json['emoji'];
    unicode = json['unicode'];
    image = json['image'];
  }

  String? name;
  String? code;
  String? emoji;
  String? unicode;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['code'] = code;
    map['emoji'] = emoji;
    map['unicode'] = unicode;
    map['image'] = image;
    return map;
  }
}
