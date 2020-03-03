/**
 * @ClassName music_model
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-03 19:21
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class MusicData {
  num mvId;
  String picUrl;
  String songName;
  String artists;
  int index;

  MusicData({
    this.mvId,
    this.picUrl,
    this.songName,
    this.artists,
    this.index,
  });
}
