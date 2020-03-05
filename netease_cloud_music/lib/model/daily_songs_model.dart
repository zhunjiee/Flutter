/**
 * @ClassName recommend_daily_model
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-04 11:58
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class DailySongsModel {
  int code;
  List<Recommend> recommend;
  Data data;

  DailySongsModel({this.code, this.recommend, this.data});

  DailySongsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['recommend'] != null) {
      recommend = new List<Recommend>();
      json['recommend'].forEach((v) {
        recommend.add(new Recommend.fromJson(v));
      });
    }
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.recommend != null) {
      data['recommend'] = this.recommend.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Recommend {
  String name;
  num id;
  num position;
  List<String> alias;
  int status;
  int fee;
  num copyrightId;
  String disc;
  int no;
  List<Artists> artists;
  Album album;
  bool starred;
  int popularity;
  int score;
  int starredNum;
  int duration;
  int playedNum;
  int dayPlays;
  int hearTime;
  String ringtone;
  String crbt;
  String copyFrom;
  String commentThreadId;
  int ftype;
  int copyright;
  int mark;
  BMusic bMusic;
  HMusic hMusic;
  HMusic mMusic;
  BMusic lMusic;
  num mvid;
  int rtype;
  String reason;
  Privilege privilege;
  String alg;

  Recommend(
      {this.name,
        this.id,
        this.position,
        this.alias,
        this.status,
        this.fee,
        this.copyrightId,
        this.disc,
        this.no,
        this.artists,
        this.album,
        this.starred,
        this.popularity,
        this.score,
        this.starredNum,
        this.duration,
        this.playedNum,
        this.dayPlays,
        this.hearTime,
        this.ringtone,
        this.crbt,
        this.copyFrom,
        this.commentThreadId,
        this.ftype,
        this.copyright,
        this.mark,
        this.bMusic,
        this.hMusic,
        this.mMusic,
        this.lMusic,
        this.mvid,
        this.rtype,
        this.reason,
        this.privilege,
        this.alg});

  Recommend.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    position = json['position'];
    alias = json['alias'].cast<String>();
    status = json['status'];
    fee = json['fee'];
    copyrightId = json['copyrightId'];
    disc = json['disc'];
    no = json['no'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    starred = json['starred'];
    popularity = json['popularity'];
    score = json['score'];
    starredNum = json['starredNum'];
    duration = json['duration'];
    playedNum = json['playedNum'];
    dayPlays = json['dayPlays'];
    hearTime = json['hearTime'];
    ringtone = json['ringtone'];
    crbt = json['crbt'];
    copyFrom = json['copyFrom'];
    commentThreadId = json['commentThreadId'];
    ftype = json['ftype'];
    copyright = json['copyright'];
    mark = json['mark'];
    bMusic =
    json['bMusic'] != null ? new BMusic.fromJson(json['bMusic']) : null;
    hMusic =
    json['hMusic'] != null ? new HMusic.fromJson(json['hMusic']) : null;
    mMusic =
    json['mMusic'] != null ? new HMusic.fromJson(json['mMusic']) : null;
    lMusic =
    json['lMusic'] != null ? new BMusic.fromJson(json['lMusic']) : null;
    mvid = json['mvid'];
    rtype = json['rtype'];
    reason = json['reason'];
    privilege = json['privilege'] != null
        ? new Privilege.fromJson(json['privilege'])
        : null;
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['position'] = this.position;
    data['alias'] = this.alias;
    data['status'] = this.status;
    data['fee'] = this.fee;
    data['copyrightId'] = this.copyrightId;
    data['disc'] = this.disc;
    data['no'] = this.no;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['starred'] = this.starred;
    data['popularity'] = this.popularity;
    data['score'] = this.score;
    data['starredNum'] = this.starredNum;
    data['duration'] = this.duration;
    data['playedNum'] = this.playedNum;
    data['dayPlays'] = this.dayPlays;
    data['hearTime'] = this.hearTime;
    data['ringtone'] = this.ringtone;
    data['crbt'] = this.crbt;
    data['copyFrom'] = this.copyFrom;
    data['commentThreadId'] = this.commentThreadId;
    data['ftype'] = this.ftype;
    data['copyright'] = this.copyright;
    data['mark'] = this.mark;
    if (this.bMusic != null) {
      data['bMusic'] = this.bMusic.toJson();
    }
    if (this.hMusic != null) {
      data['hMusic'] = this.hMusic.toJson();
    }
    if (this.mMusic != null) {
      data['mMusic'] = this.mMusic.toJson();
    }
    if (this.lMusic != null) {
      data['lMusic'] = this.lMusic.toJson();
    }
    data['mvid'] = this.mvid;
    data['rtype'] = this.rtype;
    data['reason'] = this.reason;
    if (this.privilege != null) {
      data['privilege'] = this.privilege.toJson();
    }
    data['alg'] = this.alg;
    return data;
  }
}

class Artists {
  String name;
  num id;
  num picId;
  int img1v1Id;
  String briefDesc;
  String picUrl;
  String img1v1Url;
  int albumSize;
  String trans;
  int musicSize;
  int topicPerson;

  Artists(
      {this.name,
        this.id,
        this.picId,
        this.img1v1Id,
        this.briefDesc,
        this.picUrl,
        this.img1v1Url,
        this.albumSize,
        this.trans,
        this.musicSize,
        this.topicPerson});

  Artists.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    picId = json['picId'];
    img1v1Id = json['img1v1Id'];
    briefDesc = json['briefDesc'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
    albumSize = json['albumSize'];
    trans = json['trans'];
    musicSize = json['musicSize'];
    topicPerson = json['topicPerson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['picId'] = this.picId;
    data['img1v1Id'] = this.img1v1Id;
    data['briefDesc'] = this.briefDesc;
    data['picUrl'] = this.picUrl;
    data['img1v1Url'] = this.img1v1Url;
    data['albumSize'] = this.albumSize;
    data['trans'] = this.trans;
    data['musicSize'] = this.musicSize;
    data['topicPerson'] = this.topicPerson;
    return data;
  }
}

class Album {
  String name;
  num id;
  String type;
  int size;
  num picId;
  String blurPicUrl;
  int companyId;
  num pic;
  String picUrl;
  num publishTime;
  String description;
  String tags;
  String company;
  String briefDesc;
  Artists artist;
  List<String> alias;
  int status;
  int copyrightId;
  String commentThreadId;
  List<Artists> artists;
  String subType;
  int mark;
  String picIdStr;

  Album(
      {this.name,
        this.id,
        this.type,
        this.size,
        this.picId,
        this.blurPicUrl,
        this.companyId,
        this.pic,
        this.picUrl,
        this.publishTime,
        this.description,
        this.tags,
        this.company,
        this.briefDesc,
        this.artist,
        this.alias,
        this.status,
        this.copyrightId,
        this.commentThreadId,
        this.artists,
        this.subType,
        this.mark,
        this.picIdStr});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    size = json['size'];
    picId = json['picId'];
    blurPicUrl = json['blurPicUrl'];
    companyId = json['companyId'];
    pic = json['pic'];
    picUrl = json['picUrl'];
    publishTime = json['publishTime'];
    description = json['description'];
    tags = json['tags'];
    company = json['company'];
    briefDesc = json['briefDesc'];
    artist =
    json['artist'] != null ? new Artists.fromJson(json['artist']) : null;
    alias = json['alias'].cast<String>();
    status = json['status'];
    copyrightId = json['copyrightId'];
    commentThreadId = json['commentThreadId'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    subType = json['subType'];
    mark = json['mark'];
    picIdStr = json['picId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['size'] = this.size;
    data['picId'] = this.picId;
    data['blurPicUrl'] = this.blurPicUrl;
    data['companyId'] = this.companyId;
    data['pic'] = this.pic;
    data['picUrl'] = this.picUrl;
    data['publishTime'] = this.publishTime;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['company'] = this.company;
    data['briefDesc'] = this.briefDesc;
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
    data['alias'] = this.alias;
    data['status'] = this.status;
    data['copyrightId'] = this.copyrightId;
    data['commentThreadId'] = this.commentThreadId;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['subType'] = this.subType;
    data['mark'] = this.mark;
    data['picId_str'] = this.picIdStr;
    return data;
  }
}

class BMusic {
  String name;
  num id;
  num size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  num volumeDelta;

  BMusic(
      {this.name,
        this.id,
        this.size,
        this.extension,
        this.sr,
        this.dfsId,
        this.bitrate,
        this.playTime,
        this.volumeDelta});

  BMusic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    size = json['size'];
    extension = json['extension'];
    sr = json['sr'];
    dfsId = json['dfsId'];
    bitrate = json['bitrate'];
    playTime = json['playTime'];
    volumeDelta = json['volumeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['size'] = this.size;
    data['extension'] = this.extension;
    data['sr'] = this.sr;
    data['dfsId'] = this.dfsId;
    data['bitrate'] = this.bitrate;
    data['playTime'] = this.playTime;
    data['volumeDelta'] = this.volumeDelta;
    return data;
  }
}

class HMusic {
  String name;
  num id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  num volumeDelta;

  HMusic(
      {this.name,
        this.id,
        this.size,
        this.extension,
        this.sr,
        this.dfsId,
        this.bitrate,
        this.playTime,
        this.volumeDelta});

  HMusic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    size = json['size'];
    extension = json['extension'];
    sr = json['sr'];
    dfsId = json['dfsId'];
    bitrate = json['bitrate'];
    playTime = json['playTime'];
    volumeDelta = json['volumeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['size'] = this.size;
    data['extension'] = this.extension;
    data['sr'] = this.sr;
    data['dfsId'] = this.dfsId;
    data['bitrate'] = this.bitrate;
    data['playTime'] = this.playTime;
    data['volumeDelta'] = this.volumeDelta;
    return data;
  }
}

class Privilege {
  num id;
  int fee;
  int payed;
  int st;
  num pl;
  num dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  num maxbr;
  num fl;
  bool toast;
  int flag;
  bool preSell;

  Privilege(
      {this.id,
        this.fee,
        this.payed,
        this.st,
        this.pl,
        this.dl,
        this.sp,
        this.cp,
        this.subp,
        this.cs,
        this.maxbr,
        this.fl,
        this.toast,
        this.flag,
        this.preSell});

  Privilege.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fee = json['fee'];
    payed = json['payed'];
    st = json['st'];
    pl = json['pl'];
    dl = json['dl'];
    sp = json['sp'];
    cp = json['cp'];
    subp = json['subp'];
    cs = json['cs'];
    maxbr = json['maxbr'];
    fl = json['fl'];
    toast = json['toast'];
    flag = json['flag'];
    preSell = json['preSell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fee'] = this.fee;
    data['payed'] = this.payed;
    data['st'] = this.st;
    data['pl'] = this.pl;
    data['dl'] = this.dl;
    data['sp'] = this.sp;
    data['cp'] = this.cp;
    data['subp'] = this.subp;
    data['cs'] = this.cs;
    data['maxbr'] = this.maxbr;
    data['fl'] = this.fl;
    data['toast'] = this.toast;
    data['flag'] = this.flag;
    data['preSell'] = this.preSell;
    return data;
  }
}

class Data {
  List<DailySongs> dailySongs;

  Data({this.dailySongs});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['dailySongs'] != null) {
      dailySongs = new List<DailySongs>();
      json['dailySongs'].forEach((v) {
        dailySongs.add(new DailySongs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dailySongs != null) {
      data['dailySongs'] = this.dailySongs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DailySongs {
  String name;
  num id;
  num position;
  List<String> alias;
  int status;
  int fee;
  num copyrightId;
  String disc;
  int no;
  List<Artists> artists;
  Album album;
  bool starred;
  int popularity;
  int score;
  int starredNum;
  int duration;
  int playedNum;
  int dayPlays;
  int hearTime;
  String ringtone;
  String crbt;
  String copyFrom;
  String commentThreadId;
  int ftype;
  int copyright;
  int mark;
  BMusic bMusic;
  HMusic hMusic;
  HMusic mMusic;
  BMusic lMusic;
  int mvid;
  int rtype;
  String reason;
  Privilege privilege;
  String alg;

  DailySongs(
      {this.name,
        this.id,
        this.position,
        this.alias,
        this.status,
        this.fee,
        this.copyrightId,
        this.disc,
        this.no,
        this.artists,
        this.album,
        this.starred,
        this.popularity,
        this.score,
        this.starredNum,
        this.duration,
        this.playedNum,
        this.dayPlays,
        this.hearTime,
        this.ringtone,
        this.crbt,
        this.copyFrom,
        this.commentThreadId,
        this.ftype,
        this.copyright,
        this.mark,
        this.bMusic,
        this.hMusic,
        this.mMusic,
        this.lMusic,
        this.mvid,
        this.rtype,
        this.reason,
        this.privilege,
        this.alg});

  DailySongs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    position = json['position'];
    alias = json['alias'].cast<String>();
    status = json['status'];
    fee = json['fee'];
    copyrightId = json['copyrightId'];
    disc = json['disc'];
    no = json['no'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    starred = json['starred'];
    popularity = json['popularity'];
    score = json['score'];
    starredNum = json['starredNum'];
    duration = json['duration'];
    playedNum = json['playedNum'];
    dayPlays = json['dayPlays'];
    hearTime = json['hearTime'];
    ringtone = json['ringtone'];
    crbt = json['crbt'];
    copyFrom = json['copyFrom'];
    commentThreadId = json['commentThreadId'];
    ftype = json['ftype'];
    copyright = json['copyright'];
    mark = json['mark'];
    bMusic =
    json['bMusic'] != null ? new BMusic.fromJson(json['bMusic']) : null;
    hMusic =
    json['hMusic'] != null ? new HMusic.fromJson(json['hMusic']) : null;
    mMusic =
    json['mMusic'] != null ? new HMusic.fromJson(json['mMusic']) : null;
    lMusic =
    json['lMusic'] != null ? new BMusic.fromJson(json['lMusic']) : null;
    mvid = json['mvid'];
    rtype = json['rtype'];
    reason = json['reason'];
    privilege = json['privilege'] != null
        ? new Privilege.fromJson(json['privilege'])
        : null;
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['position'] = this.position;
    data['alias'] = this.alias;
    data['status'] = this.status;
    data['fee'] = this.fee;
    data['copyrightId'] = this.copyrightId;
    data['disc'] = this.disc;
    data['no'] = this.no;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['starred'] = this.starred;
    data['popularity'] = this.popularity;
    data['score'] = this.score;
    data['starredNum'] = this.starredNum;
    data['duration'] = this.duration;
    data['playedNum'] = this.playedNum;
    data['dayPlays'] = this.dayPlays;
    data['hearTime'] = this.hearTime;
    data['ringtone'] = this.ringtone;
    data['crbt'] = this.crbt;
    data['copyFrom'] = this.copyFrom;
    data['commentThreadId'] = this.commentThreadId;
    data['ftype'] = this.ftype;
    data['copyright'] = this.copyright;
    data['mark'] = this.mark;
    if (this.bMusic != null) {
      data['bMusic'] = this.bMusic.toJson();
    }
    if (this.hMusic != null) {
      data['hMusic'] = this.hMusic.toJson();
    }
    if (this.mMusic != null) {
      data['mMusic'] = this.mMusic.toJson();
    }
    if (this.lMusic != null) {
      data['lMusic'] = this.lMusic.toJson();
    }
    data['mvid'] = this.mvid;
    data['rtype'] = this.rtype;
    data['reason'] = this.reason;
    if (this.privilege != null) {
      data['privilege'] = this.privilege.toJson();
    }
    data['alg'] = this.alg;
    return data;
  }
}