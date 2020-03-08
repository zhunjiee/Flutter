/**
 * @ClassName music_model
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-03 19:21
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class MusicData {
  num id; // 歌曲ID
  String name;  // 歌曲名称
  String picUrl;  // 歌曲图片
  num mvId; // 歌曲MV
  String artists; // 歌曲作者
  int index;  // 歌曲前面的排序索引, 只在歌单页面显示

  MusicData({
    this.id,
    this.name,
    this.picUrl,
    this.mvId,
    this.artists,
    this.index,
  });

  MusicData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    artists = json['artists'];
    if (json['mvId'] != null) {
      mvId = json['mvId'];
    } else if (json['mv'] != null) {
      mvId = json['mv'];
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['picUrl'] = picUrl;
    data['artists'] = artists;
    data['mvId'] = mvId;
    return data;
  }
}
