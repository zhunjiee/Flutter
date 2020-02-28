/**
 * @ClassName mv_model
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-28 19:24
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class MvModel {
  int updateTime;
  List<MvData> data;
  bool hasMore;
  int code;

  MvModel({this.updateTime, this.data, this.hasMore, this.code});

  MvModel.fromJson(Map<String, dynamic> json) {
    updateTime = json['updateTime'];
    if (json['data'] != null) {
      data = new List<MvData>();
      json['data'].forEach((v) {
        data.add(new MvData.fromJson(v));
      });
    }
    hasMore = json['hasMore'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updateTime'] = this.updateTime;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['hasMore'] = this.hasMore;
    data['code'] = this.code;
    return data;
  }
}

class MvData {
  int id;
  String cover;
  String name;
  int playCount;
  String artistName;
  int artistId;
  int duration;
  int mark;
  int lastRank;
  int score;
  bool subed;
  List<Artists> artists;

  MvData(
      {this.id,
        this.cover,
        this.name,
        this.playCount,
        this.artistName,
        this.artistId,
        this.duration,
        this.mark,
        this.lastRank,
        this.score,
        this.subed,
        this.artists});

  MvData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'];
    name = json['name'];
    playCount = json['playCount'];
    artistName = json['artistName'];
    artistId = json['artistId'];
    duration = json['duration'];
    mark = json['mark'];
    lastRank = json['lastRank'];
    score = json['score'];
    subed = json['subed'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cover'] = this.cover;
    data['name'] = this.name;
    data['playCount'] = this.playCount;
    data['artistName'] = this.artistName;
    data['artistId'] = this.artistId;
    data['duration'] = this.duration;
    data['mark'] = this.mark;
    data['lastRank'] = this.lastRank;
    data['score'] = this.score;
    data['subed'] = this.subed;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Artists {
  int id;
  String name;

  Artists({this.id, this.name});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
