/**
 * @ClassName top_list_model
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-05 13:05
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class TopListModel {
  int code;
  List<TopList> list;

  TopListModel({this.code, this.list});

  TopListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['list'] != null) {
      list = new List<TopList>();
      json['list'].forEach((v) {
        list.add(new TopList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopList {
  List<Tracks> tracks;
  String updateFrequency;
  int backgroundCoverId;
  int titleImage;
  bool opRecommend;
  String description;
  List<String> tags;
  num createTime;
  int userId;
  num coverImgId;
  bool newImported;
  bool anonimous;
  num updateTime;
  int specialType;
  String commentThreadId;
  int privacy;
  num trackUpdateTime;
  int trackCount;
  int totalDuration;
  String coverImgUrl;
  bool highQuality;
  num playCount;
  num trackNumberUpdateTime;
  int subscribedCount;
  int cloudTrackCount;
  bool ordered;
  int adType;
  int status;
  String name;
  int id;
  String coverImgIdStr;
  String toplistType;

  TopList(
      {this.tracks,
        this.updateFrequency,
        this.backgroundCoverId,
        this.titleImage,
        this.opRecommend,
        this.description,
        this.tags,
        this.createTime,
        this.userId,
        this.coverImgId,
        this.newImported,
        this.anonimous,
        this.updateTime,
        this.specialType,
        this.commentThreadId,
        this.privacy,
        this.trackUpdateTime,
        this.trackCount,
        this.totalDuration,
        this.coverImgUrl,
        this.highQuality,
        this.playCount,
        this.trackNumberUpdateTime,
        this.subscribedCount,
        this.cloudTrackCount,
        this.ordered,
        this.adType,
        this.status,
        this.name,
        this.id,
        this.coverImgIdStr,
        this.toplistType});

  TopList.fromJson(Map<String, dynamic> json) {
    if (json['tracks'] != null) {
      tracks = new List<Tracks>();
      json['tracks'].forEach((v) {
        tracks.add(new Tracks.fromJson(v));
      });
    }
    updateFrequency = json['updateFrequency'];
    backgroundCoverId = json['backgroundCoverId'];
    titleImage = json['titleImage'];
    opRecommend = json['opRecommend'];
    description = json['description'];
    if (json['tags'] != null) {
      tags = (json['tags'] as List).cast<String>();
    }
    createTime = json['createTime'];
    userId = json['userId'];
    coverImgId = json['coverImgId'];
    newImported = json['newImported'];
    anonimous = json['anonimous'];
    updateTime = json['updateTime'];
    specialType = json['specialType'];
    commentThreadId = json['commentThreadId'];
    privacy = json['privacy'];
    trackUpdateTime = json['trackUpdateTime'];
    trackCount = json['trackCount'];
    totalDuration = json['totalDuration'];
    coverImgUrl = json['coverImgUrl'];
    highQuality = json['highQuality'];
    playCount = json['playCount'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    subscribedCount = json['subscribedCount'];
    cloudTrackCount = json['cloudTrackCount'];
    ordered = json['ordered'];
    adType = json['adType'];
    status = json['status'];
    name = json['name'];
    id = json['id'];
    coverImgIdStr = json['coverImgId_str'];
    toplistType = json['ToplistType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tracks != null) {
      data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
    }
    data['updateFrequency'] = this.updateFrequency;
    data['backgroundCoverId'] = this.backgroundCoverId;
    data['titleImage'] = this.titleImage;
    data['opRecommend'] = this.opRecommend;
    data['description'] = this.description;
    if (data['tags'] != null) {
        data['tags'] = this.tags;
    }
    data['createTime'] = this.createTime;
    data['userId'] = this.userId;
    data['coverImgId'] = this.coverImgId;
    data['newImported'] = this.newImported;
    data['anonimous'] = this.anonimous;
    data['updateTime'] = this.updateTime;
    data['specialType'] = this.specialType;
    data['commentThreadId'] = this.commentThreadId;
    data['privacy'] = this.privacy;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['trackCount'] = this.trackCount;
    data['totalDuration'] = this.totalDuration;
    data['coverImgUrl'] = this.coverImgUrl;
    data['highQuality'] = this.highQuality;
    data['playCount'] = this.playCount;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['subscribedCount'] = this.subscribedCount;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['ordered'] = this.ordered;
    data['adType'] = this.adType;
    data['status'] = this.status;
    data['name'] = this.name;
    data['id'] = this.id;
    data['coverImgId_str'] = this.coverImgIdStr;
    data['ToplistType'] = this.toplistType;
    return data;
  }
}

class Tracks {
  String first;
  String second;

  Tracks({this.first, this.second});

  Tracks.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    return data;
  }
}
