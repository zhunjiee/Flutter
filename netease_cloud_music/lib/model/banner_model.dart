class BannerModel {
  List<BannerInfo> banners;
  int code;

  BannerModel({this.banners, this.code});

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = new List<BannerInfo>();
      json['banners'].forEach((v) {
        banners.add(new BannerInfo.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class BannerInfo {
  String pic;
  int targetId;
  int targetType;

  BannerInfo({this.pic, this.targetId, this.targetType});

  BannerInfo.fromJson(Map<String, dynamic> json) {
    pic = json['pic'];
    targetId = json['targetId'];
    targetType = json['targetType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic'] = this.pic;
    data['targetId'] = this.targetId;
    data['targetType'] = this.targetType;
    return data;
  }
}
