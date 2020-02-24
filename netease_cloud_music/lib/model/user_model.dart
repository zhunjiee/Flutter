/**
 * @ClassName user_model
 * @Description 用户信息模型
 * @Author HouGe
 * @Date 2020-02-24 12:50
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class UserModel {
  int loginType;
  int code;
  String msg;
  Account account;
  String token;
  Profile profile;
  List<Bindings> bindings;

  UserModel({
    this.loginType,
    this.code,
    this.msg,
    this.account,
    this.token,
    this.profile,
    this.bindings,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    loginType = json['loginType'];
    code = json['code'];
    msg = json['msg'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    token = json['token'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['bindings'] != null) {
      bindings = new List<Bindings>();
      json['bindings'].forEach((v) {
        bindings.add(new Bindings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginType'] = this.loginType;
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    data['token'] = this.token;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.bindings != null) {
      data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Account {
  int id;
  String userName;
  int type;
  int status;
  int whitelistAuthority;
  int createTime;
  String salt;
  int tokenVersion;
  int ban;
  int baoYueVersion;
  int donateVersion;
  int vipType;
  int vipTypeVersion;
  bool anonymousUser;

  Account({
    this.id,
    this.userName,
    this.type,
    this.status,
    this.whitelistAuthority,
    this.createTime,
    this.salt,
    this.tokenVersion,
    this.ban,
    this.baoYueVersion,
    this.donateVersion,
    this.vipType,
    this.vipTypeVersion,
    this.anonymousUser,
  });

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    type = json['type'];
    status = json['status'];
    whitelistAuthority = json['whitelistAuthority'];
    createTime = json['createTime'];
    salt = json['salt'];
    tokenVersion = json['tokenVersion'];
    ban = json['ban'];
    baoYueVersion = json['baoyueVersion'];
    donateVersion = json['donateVersion'];
    vipType = json['vipType'];
    vipTypeVersion = json['viptypeVersion'];
    anonymousUser = json['anonimousUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['type'] = this.type;
    data['status'] = this.status;
    data['whitelistAuthority'] = this.whitelistAuthority;
    data['createTime'] = this.createTime;
    data['salt'] = this.salt;
    data['tokenVersion'] = this.tokenVersion;
    data['ban'] = this.ban;
    data['baoyueVersion'] = this.baoYueVersion;
    data['donateVersion'] = this.donateVersion;
    data['vipType'] = this.vipType;
    data['viptypeVersion'] = this.vipTypeVersion;
    data['anonimousUser'] = this.anonymousUser;
    return data;
  }
}

class Profile {
  String description;
  String detailDescription;
  bool followed;
  String backgroundUrl;
  int vipType;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  int backgroundImgId;
  int userType;
  Null remarkName;
  bool mutual;
  Null expertTags;
  int authStatus;
  int userId;
  String nickname;
  int birthday;
  int city;
  int djStatus;
  int gender;
  int accountStatus;
  int avatarImgId;
  int province;
  bool defaultAvatar;
  String avatarUrl;
  String signature;
  int authority;
  int follows;
  int eventCount;
  int playlistCount;
  int playlistBeSubscribedCount;

  Profile({
    this.description,
    this.detailDescription,
    this.followed,
    this.backgroundUrl,
    this.vipType,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.backgroundImgId,
    this.userType,
    this.remarkName,
    this.mutual,
    this.expertTags,
    this.authStatus,
    this.userId,
    this.nickname,
    this.birthday,
    this.city,
    this.djStatus,
    this.gender,
    this.accountStatus,
    this.avatarImgId,
    this.province,
    this.defaultAvatar,
    this.avatarUrl,
    this.signature,
    this.authority,
    this.follows,
    this.eventCount,
    this.playlistCount,
    this.playlistBeSubscribedCount,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    detailDescription = json['detailDescription'];
    followed = json['followed'];
    backgroundUrl = json['backgroundUrl'];
    vipType = json['vipType'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    backgroundImgId = json['backgroundImgId'];
    userType = json['userType'];
    remarkName = json['remarkName'];
    mutual = json['mutual'];
    expertTags = json['expertTags'];
    authStatus = json['authStatus'];
    userId = json['userId'];
    nickname = json['nickname'];
    birthday = json['birthday'];
    city = json['city'];
    djStatus = json['djStatus'];
    gender = json['gender'];
    accountStatus = json['accountStatus'];
    avatarImgId = json['avatarImgId'];
    province = json['province'];
    defaultAvatar = json['defaultAvatar'];
    avatarUrl = json['avatarUrl'];
    signature = json['signature'];
    authority = json['authority'];
    follows = json['follows'];
    eventCount = json['eventCount'];
    playlistCount = json['playlistCount'];
    playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['detailDescription'] = this.detailDescription;
    data['followed'] = this.followed;
    data['backgroundUrl'] = this.backgroundUrl;
    data['vipType'] = this.vipType;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['backgroundImgId'] = this.backgroundImgId;
    data['userType'] = this.userType;
    data['remarkName'] = this.remarkName;
    data['mutual'] = this.mutual;
    data['expertTags'] = this.expertTags;
    data['authStatus'] = this.authStatus;
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data['birthday'] = this.birthday;
    data['city'] = this.city;
    data['djStatus'] = this.djStatus;
    data['gender'] = this.gender;
    data['accountStatus'] = this.accountStatus;
    data['avatarImgId'] = this.avatarImgId;
    data['province'] = this.province;
    data['defaultAvatar'] = this.defaultAvatar;
    data['avatarUrl'] = this.avatarUrl;
    data['signature'] = this.signature;
    data['authority'] = this.authority;
    data['follows'] = this.follows;
    data['eventCount'] = this.eventCount;
    data['playlistCount'] = this.playlistCount;
    data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
    return data;
  }
}

class Bindings {
  int refreshTime;
  String tokenJsonStr;
  int bindingTime;
  int userId;
  int expiresIn;
  String url;
  bool expired;
  int id;
  int type;

  Bindings(
      {this.refreshTime,
      this.tokenJsonStr,
      this.bindingTime,
      this.userId,
      this.expiresIn,
      this.url,
      this.expired,
      this.id,
      this.type});

  Bindings.fromJson(Map<String, dynamic> json) {
    refreshTime = json['refreshTime'];
    tokenJsonStr = json['tokenJsonStr'];
    bindingTime = json['bindingTime'];
    userId = json['userId'];
    expiresIn = json['expiresIn'];
    url = json['url'];
    expired = json['expired'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshTime'] = this.refreshTime;
    data['tokenJsonStr'] = this.tokenJsonStr;
    data['bindingTime'] = this.bindingTime;
    data['userId'] = this.userId;
    data['expiresIn'] = this.expiresIn;
    data['url'] = this.url;
    data['expired'] = this.expired;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}
