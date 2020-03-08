/**
 * @ClassName recommend_playlist_model
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-27 15:52
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class RecommendPlaylistModel {
  int code;
  bool featureFirst;
  bool haveRcmdSongs;
  List<Recommend> recommend;

  RecommendPlaylistModel(
      {this.code, this.featureFirst, this.haveRcmdSongs, this.recommend});

  RecommendPlaylistModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    featureFirst = json['featureFirst'];
    haveRcmdSongs = json['haveRcmdSongs'];
    if (json['recommend'] != null) {
      recommend = new List<Recommend>();
      json['recommend'].forEach((v) {
        recommend.add(new Recommend.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['featureFirst'] = this.featureFirst;
    data['haveRcmdSongs'] = this.haveRcmdSongs;
    if (this.recommend != null) {
      data['recommend'] = this.recommend.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recommend {
  int id;
  int type;
  String name;
  String copywriter;
  String picUrl;
  int playCount;
  int createTime;
  Creator creator;
  int trackCount;
  int userId;
  String alg;

  Recommend(
      {this.id,
        this.type,
        this.name,
        this.copywriter,
        this.picUrl,
        this.playCount,
        this.createTime,
        this.creator,
        this.trackCount,
        this.userId,
        this.alg});

  Recommend.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    copywriter = json['copywriter'];
    picUrl = json['picUrl'];
    playCount = json['playcount'];
    createTime = json['createTime'];
    creator =
    json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    trackCount = json['trackCount'];
    userId = json['userId'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['copywriter'] = this.copywriter;
    data['picUrl'] = this.picUrl;
    data['playcount'] = this.playCount;
    data['createTime'] = this.createTime;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    data['trackCount'] = this.trackCount;
    data['userId'] = this.userId;
    data['alg'] = this.alg;
    return data;
  }
}

class Creator {
  String remarkName;
  bool mutual;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  String detailDescription;
  bool defaultAvatar;
  List expertTags;
  int djStatus;
  bool followed;
  String backgroundImgIdStr;
  String avatarImgIdStr;
  int accountStatus;
  int userId;
  int vipType;
  int province;
  String avatarUrl;
  int authStatus;
  int userType;
  String nickname;
  int gender;
  int birthday;
  int city;
  String description;
  String signature;
  int authority;

  Creator(
      {this.remarkName,
        this.mutual,
        this.avatarImgId,
        this.backgroundImgId,
        this.backgroundUrl,
        this.detailDescription,
        this.defaultAvatar,
        this.expertTags,
        this.djStatus,
        this.followed,
        this.backgroundImgIdStr,
        this.avatarImgIdStr,
        this.accountStatus,
        this.userId,
        this.vipType,
        this.province,
        this.avatarUrl,
        this.authStatus,
        this.userType,
        this.nickname,
        this.gender,
        this.birthday,
        this.city,
        this.description,
        this.signature,
        this.authority});

  Creator.fromJson(Map<String, dynamic> json) {
    remarkName = json['remarkName'];
    mutual = json['mutual'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    backgroundUrl = json['backgroundUrl'];
    detailDescription = json['detailDescription'];
    defaultAvatar = json['defaultAvatar'];
    expertTags = json['expertTags'];
    djStatus = json['djStatus'];
    followed = json['followed'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    avatarImgIdStr = json['avatarImgIdStr'];
    accountStatus = json['accountStatus'];
    userId = json['userId'];
    vipType = json['vipType'];
    province = json['province'];
    avatarUrl = json['avatarUrl'];
    authStatus = json['authStatus'];
    userType = json['userType'];
    nickname = json['nickname'];
    gender = json['gender'];
    birthday = json['birthday'];
    city = json['city'];
    description = json['description'];
    signature = json['signature'];
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remarkName'] = this.remarkName;
    data['mutual'] = this.mutual;
    data['avatarImgId'] = this.avatarImgId;
    data['backgroundImgId'] = this.backgroundImgId;
    data['backgroundUrl'] = this.backgroundUrl;
    data['detailDescription'] = this.detailDescription;
    data['defaultAvatar'] = this.defaultAvatar;
    data['expertTags'] = this.expertTags;
    data['djStatus'] = this.djStatus;
    data['followed'] = this.followed;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['accountStatus'] = this.accountStatus;
    data['userId'] = this.userId;
    data['vipType'] = this.vipType;
    data['province'] = this.province;
    data['avatarUrl'] = this.avatarUrl;
    data['authStatus'] = this.authStatus;
    data['userType'] = this.userType;
    data['nickname'] = this.nickname;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['city'] = this.city;
    data['description'] = this.description;
    data['signature'] = this.signature;
    data['authority'] = this.authority;
    return data;
  }
}
