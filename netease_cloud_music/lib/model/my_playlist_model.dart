/**
 * @ClassName my_playlist_model
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-01 18:36
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class MyPlaylistModel {
  int code;
  Playlist playlist;
  List<Privileges> privileges;

  MyPlaylistModel({this.code, this.playlist, this.privileges});

  MyPlaylistModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    playlist = json['playlist'] != null
        ? new Playlist.fromJson(json['playlist'])
        : null;
    if (json['privileges'] != null) {
      privileges = new List<Privileges>();
      json['privileges'].forEach((v) {
        privileges.add(new Privileges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.playlist != null) {
      data['playlist'] = this.playlist.toJson();
    }
    if (this.privileges != null) {
      data['privileges'] = this.privileges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Playlist {
  List<Subscribers> subscribers;
  bool subscribed;
  Subscribers creator;
  List<Tracks> tracks;
  List<TrackIds> trackIds;
  String updateFrequency;
  int backgroundCoverId;
  String backgroundCoverUrl;
  int titleImage;
  String titleImageUrl;
  String englishTitle;
  bool opRecommend;
  int userId;
  bool ordered;
  int playCount;
  int trackNumberUpdateTime;
  int createTime;
  bool highQuality;
  int privacy;
  int trackUpdateTime;
  int trackCount;
  int updateTime;
  bool newImported;
  int coverImgId;
  String coverImgUrl;
  String commentThreadId;
  int specialType;
  String description;
  List<String> tags;
  int status;
  int adType;
  int subscribedCount;
  int cloudTrackCount;
  String name;
  int id;
  int shareCount;
  String coverImgIdStr;
  int commentCount;

  Playlist(
      {this.subscribers,
        this.subscribed,
        this.creator,
        this.tracks,
        this.trackIds,
        this.updateFrequency,
        this.backgroundCoverId,
        this.backgroundCoverUrl,
        this.titleImage,
        this.titleImageUrl,
        this.englishTitle,
        this.opRecommend,
        this.userId,
        this.ordered,
        this.playCount,
        this.trackNumberUpdateTime,
        this.createTime,
        this.highQuality,
        this.privacy,
        this.trackUpdateTime,
        this.trackCount,
        this.updateTime,
        this.newImported,
        this.coverImgId,
        this.coverImgUrl,
        this.commentThreadId,
        this.specialType,
        this.description,
        this.tags,
        this.status,
        this.adType,
        this.subscribedCount,
        this.cloudTrackCount,
        this.name,
        this.id,
        this.shareCount,
        this.coverImgIdStr,
        this.commentCount});

  Playlist.fromJson(Map<String, dynamic> json) {
    if (json['subscribers'] != null) {
      subscribers = new List<Subscribers>();
      json['subscribers'].forEach((v) {
        subscribers.add(new Subscribers.fromJson(v));
      });
    }
    subscribed = json['subscribed'];
    creator = json['creator'] != null
        ? new Subscribers.fromJson(json['creator'])
        : null;
    if (json['tracks'] != null) {
      tracks = new List<Tracks>();
      json['tracks'].forEach((v) {
        tracks.add(new Tracks.fromJson(v));
      });
    }
    if (json['trackIds'] != null) {
      trackIds = new List<TrackIds>();
      json['trackIds'].forEach((v) {
        trackIds.add(new TrackIds.fromJson(v));
      });
    }
    updateFrequency = json['updateFrequency'];
    backgroundCoverId = json['backgroundCoverId'];
    backgroundCoverUrl = json['backgroundCoverUrl'];
    titleImage = json['titleImage'];
    titleImageUrl = json['titleImageUrl'];
    englishTitle = json['englishTitle'];
    opRecommend = json['opRecommend'];
    userId = json['userId'];
    ordered = json['ordered'];
    playCount = json['playCount'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    createTime = json['createTime'];
    highQuality = json['highQuality'];
    privacy = json['privacy'];
    trackUpdateTime = json['trackUpdateTime'];
    trackCount = json['trackCount'];
    updateTime = json['updateTime'];
    newImported = json['newImported'];
    coverImgId = json['coverImgId'];
    coverImgUrl = json['coverImgUrl'];
    commentThreadId = json['commentThreadId'];
    specialType = json['specialType'];
    description = json['description'];
    tags = json['tags'].cast<String>();
    status = json['status'];
    adType = json['adType'];
    subscribedCount = json['subscribedCount'];
    cloudTrackCount = json['cloudTrackCount'];
    name = json['name'];
    id = json['id'];
    shareCount = json['shareCount'];
    coverImgIdStr = json['coverImgId_str'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subscribers != null) {
      data['subscribers'] = this.subscribers.map((v) => v.toJson()).toList();
    }
    data['subscribed'] = this.subscribed;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    if (this.tracks != null) {
      data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
    }
    if (this.trackIds != null) {
      data['trackIds'] = this.trackIds.map((v) => v.toJson()).toList();
    }
    data['updateFrequency'] = this.updateFrequency;
    data['backgroundCoverId'] = this.backgroundCoverId;
    data['backgroundCoverUrl'] = this.backgroundCoverUrl;
    data['titleImage'] = this.titleImage;
    data['titleImageUrl'] = this.titleImageUrl;
    data['englishTitle'] = this.englishTitle;
    data['opRecommend'] = this.opRecommend;
    data['userId'] = this.userId;
    data['ordered'] = this.ordered;
    data['playCount'] = this.playCount;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['createTime'] = this.createTime;
    data['highQuality'] = this.highQuality;
    data['privacy'] = this.privacy;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['trackCount'] = this.trackCount;
    data['updateTime'] = this.updateTime;
    data['newImported'] = this.newImported;
    data['coverImgId'] = this.coverImgId;
    data['coverImgUrl'] = this.coverImgUrl;
    data['commentThreadId'] = this.commentThreadId;
    data['specialType'] = this.specialType;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['status'] = this.status;
    data['adType'] = this.adType;
    data['subscribedCount'] = this.subscribedCount;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['name'] = this.name;
    data['id'] = this.id;
    data['shareCount'] = this.shareCount;
    data['coverImgId_str'] = this.coverImgIdStr;
    data['commentCount'] = this.commentCount;
    return data;
  }
}

class Subscribers {
  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  String detailDescription;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  int djStatus;
  int vipType;
  String avatarImgIdStr;
  String backgroundImgIdStr;

  Subscribers(
      {this.defaultAvatar,
        this.province,
        this.authStatus,
        this.followed,
        this.avatarUrl,
        this.accountStatus,
        this.gender,
        this.city,
        this.birthday,
        this.userId,
        this.userType,
        this.nickname,
        this.signature,
        this.description,
        this.detailDescription,
        this.avatarImgId,
        this.backgroundImgId,
        this.backgroundUrl,
        this.authority,
        this.mutual,
        this.djStatus,
        this.vipType,
        this.avatarImgIdStr,
        this.backgroundImgIdStr});

  Subscribers.fromJson(Map<String, dynamic> json) {
    defaultAvatar = json['defaultAvatar'];
    province = json['province'];
    authStatus = json['authStatus'];
    followed = json['followed'];
    avatarUrl = json['avatarUrl'];
    accountStatus = json['accountStatus'];
    gender = json['gender'];
    city = json['city'];
    birthday = json['birthday'];
    userId = json['userId'];
    userType = json['userType'];
    nickname = json['nickname'];
    signature = json['signature'];
    description = json['description'];
    detailDescription = json['detailDescription'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    backgroundUrl = json['backgroundUrl'];
    authority = json['authority'];
    mutual = json['mutual'];
    djStatus = json['djStatus'];
    vipType = json['vipType'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defaultAvatar'] = this.defaultAvatar;
    data['province'] = this.province;
    data['authStatus'] = this.authStatus;
    data['followed'] = this.followed;
    data['avatarUrl'] = this.avatarUrl;
    data['accountStatus'] = this.accountStatus;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['birthday'] = this.birthday;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['nickname'] = this.nickname;
    data['signature'] = this.signature;
    data['description'] = this.description;
    data['detailDescription'] = this.detailDescription;
    data['avatarImgId'] = this.avatarImgId;
    data['backgroundImgId'] = this.backgroundImgId;
    data['backgroundUrl'] = this.backgroundUrl;
    data['authority'] = this.authority;
    data['mutual'] = this.mutual;
    data['djStatus'] = this.djStatus;
    data['vipType'] = this.vipType;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    return data;
  }
}

class Tracks {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  int pop;
  int st;
  String rt;
  int fee;
  int v;
  String cf;
  Al al;
  int dt;
  H h;
  H m;
  H l;
  String cd;
  int no;
  int fType;
  int djId;
  int copyright;
  int sId;
  int mark;
  int mst;
  int cp;
  int mv;
  int rType;
  int publishTime;
  String alg;

  Tracks(
      {this.name,
        this.id,
        this.pst,
        this.t,
        this.ar,
        this.pop,
        this.st,
        this.rt,
        this.fee,
        this.v,
        this.cf,
        this.al,
        this.dt,
        this.h,
        this.m,
        this.l,
        this.cd,
        this.no,
        this.fType,
        this.djId,
        this.copyright,
        this.sId,
        this.mark,
        this.mst,
        this.cp,
        this.mv,
        this.rType,
        this.publishTime,
        this.alg});

  Tracks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    pst = json['pst'];
    t = json['t'];
    if (json['ar'] != null) {
      ar = new List<Ar>();
      json['ar'].forEach((v) {
        ar.add(new Ar.fromJson(v));
      });
    }
    pop = json['pop'];
    st = json['st'];
    rt = json['rt'];
    fee = json['fee'];
    v = json['v'];
    cf = json['cf'];
    al = json['al'] != null ? new Al.fromJson(json['al']) : null;
    dt = json['dt'];
    h = json['h'] != null ? new H.fromJson(json['h']) : null;
    m = json['m'] != null ? new H.fromJson(json['m']) : null;
    l = json['l'] != null ? new H.fromJson(json['l']) : null;
    cd = json['cd'];
    no = json['no'];
    fType = json['ftype'];
    djId = json['djId'];
    copyright = json['copyright'];
    sId = json['s_id'];
    mark = json['mark'];
    mst = json['mst'];
    cp = json['cp'];
    mv = json['mv'];
    rType = json['rtype'];
    publishTime = json['publishTime'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['pst'] = this.pst;
    data['t'] = this.t;
    if (this.ar != null) {
      data['ar'] = this.ar.map((v) => v.toJson()).toList();
    }
    data['pop'] = this.pop;
    data['st'] = this.st;
    data['rt'] = this.rt;
    data['fee'] = this.fee;
    data['v'] = this.v;
    data['cf'] = this.cf;
    if (this.al != null) {
      data['al'] = this.al.toJson();
    }
    data['dt'] = this.dt;
    if (this.h != null) {
      data['h'] = this.h.toJson();
    }
    if (this.m != null) {
      data['m'] = this.m.toJson();
    }
    if (this.l != null) {
      data['l'] = this.l.toJson();
    }
    data['cd'] = this.cd;
    data['no'] = this.no;
    data['ftype'] = this.fType;
    data['djId'] = this.djId;
    data['copyright'] = this.copyright;
    data['s_id'] = this.sId;
    data['mark'] = this.mark;
    data['mst'] = this.mst;
    data['cp'] = this.cp;
    data['mv'] = this.mv;
    data['rtype'] = this.rType;
    data['publishTime'] = this.publishTime;
    data['alg'] = this.alg;
    return data;
  }
}

class Ar {
  int id;
  String name;

  Ar({this.id, this.name});

  Ar.fromJson(Map<String, dynamic> json) {
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

class Al {
  int id;
  String name;
  String picUrl;
  String picStr;
  int pic;

  Al({this.id, this.name, this.picUrl, this.picStr, this.pic});

  Al.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    picStr = json['pic_str'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
    data['pic_str'] = this.picStr;
    data['pic'] = this.pic;
    return data;
  }
}

class H {
  int br;
  int fid;
  int size;
  int vd;

  H({this.br, this.fid, this.size, this.vd});

  H.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = json['vd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['fid'] = this.fid;
    data['size'] = this.size;
    data['vd'] = this.vd;
    return data;
  }
}

class TrackIds {
  int id;
  int v;
  String alg;

  TrackIds({this.id, this.v, this.alg});

  TrackIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    v = json['v'];
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['v'] = this.v;
    data['alg'] = this.alg;
    return data;
  }
}

class Privileges {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;

  Privileges(
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

  Privileges.fromJson(Map<String, dynamic> json) {
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
