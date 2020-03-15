/**
 * @ClassName lyric_model
 * @Description TODO
 * @Author houge
 * @Date 2020/3/11 6:23 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class Lyric {
  String lyric;
  Duration startTime;
  Duration endTime;

  Lyric(this.lyric, {this.startTime, this.endTime});

  @override
  String toString() {
    return "Lyric{lyric:$lyric, startTime:$startTime, endtime:$endTime}";
  }
}

class LyricModel {
  bool sgc;
  bool sfy;
  bool qfy;
  Lrc lrc;
  Klyric klyric;
  Klyric tlyric;
  int code;

  LyricModel(
      {this.sgc,
        this.sfy,
        this.qfy,
        this.lrc,
        this.klyric,
        this.tlyric,
        this.code});

  LyricModel.fromJson(Map<String, dynamic> json) {
    sgc = json['sgc'];
    sfy = json['sfy'];
    qfy = json['qfy'];
    lrc = json['lrc'] != null ? new Lrc.fromJson(json['lrc']) : null;
    klyric =
    json['klyric'] != null ? new Klyric.fromJson(json['klyric']) : null;
    tlyric =
    json['tlyric'] != null ? new Klyric.fromJson(json['tlyric']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sgc'] = this.sgc;
    data['sfy'] = this.sfy;
    data['qfy'] = this.qfy;
    if (this.lrc != null) {
      data['lrc'] = this.lrc.toJson();
    }
    if (this.klyric != null) {
      data['klyric'] = this.klyric.toJson();
    }
    if (this.tlyric != null) {
      data['tlyric'] = this.tlyric.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class Lrc {
  int version;
  String lyric;

  Lrc({this.version, this.lyric});

  Lrc.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    lyric = json['lyric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['lyric'] = this.lyric;
    return data;
  }
}

class Klyric {
  int version;
  Null lyric;

  Klyric({this.version, this.lyric});

  Klyric.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    lyric = json['lyric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['lyric'] = this.lyric;
    return data;
  }
}
