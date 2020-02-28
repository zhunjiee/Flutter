/**
 * @ClassName album_model
 * @Description 专辑模型
 * @Author HouGe
 * @Date 2020-02-28 13:47
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class AlbumModel {
  int total;
  List<Albums> albums;
  int code;

  AlbumModel({this.total, this.albums, this.code});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['albums'] != null) {
      albums = new List<Albums>();
      json['albums'].forEach((v) {
        albums.add(new Albums.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.albums != null) {
      data['albums'] = this.albums.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Albums {
  bool paid;
  bool onSale;
  int mark;
  List<Artists> artists;
  int copyrightId;
  int picId;
  Artist artist;
  String blurPicUrl;
  int companyId;
  int pic;
  int publishTime;
  String company;
  String briefDesc;
  String commentThreadId;
  String picUrl;
  String tags;
  int status;
  String subType;
  String description;
  String name;
  int id;
  String type;
  int size;
  String picIdStr;

  Albums(
      {this.paid,
      this.onSale,
      this.mark,
      this.artists,
      this.copyrightId,
      this.picId,
      this.artist,
      this.blurPicUrl,
      this.companyId,
      this.pic,
      this.publishTime,
      this.company,
      this.briefDesc,
      this.commentThreadId,
      this.picUrl,
      this.tags,
      this.status,
      this.subType,
      this.description,
      this.name,
      this.id,
      this.type,
      this.size,
      this.picIdStr});

  Albums.fromJson(Map<String, dynamic> json) {
    paid = json['paid'];
    onSale = json['onSale'];
    mark = json['mark'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    copyrightId = json['copyrightId'];
    picId = json['picId'];
    artist =
        json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
    blurPicUrl = json['blurPicUrl'];
    companyId = json['companyId'];
    pic = json['pic'];
    publishTime = json['publishTime'];
    company = json['company'];
    briefDesc = json['briefDesc'];
    commentThreadId = json['commentThreadId'];
    picUrl = json['picUrl'];
    tags = json['tags'];
    status = json['status'];
    subType = json['subType'];
    description = json['description'];
    name = json['name'];
    id = json['id'];
    type = json['type'];
    size = json['size'];
    picIdStr = json['picId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paid'] = this.paid;
    data['onSale'] = this.onSale;
    data['mark'] = this.mark;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['copyrightId'] = this.copyrightId;
    data['picId'] = this.picId;
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
    data['blurPicUrl'] = this.blurPicUrl;
    data['companyId'] = this.companyId;
    data['pic'] = this.pic;
    data['publishTime'] = this.publishTime;
    data['company'] = this.company;
    data['briefDesc'] = this.briefDesc;
    data['commentThreadId'] = this.commentThreadId;
    data['picUrl'] = this.picUrl;
    data['tags'] = this.tags;
    data['status'] = this.status;
    data['subType'] = this.subType;
    data['description'] = this.description;
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['size'] = this.size;
    data['picId_str'] = this.picIdStr;
    return data;
  }
}

class Artists {
  int img1v1Id;
  int topicPerson;
  bool followed;
  int picId;
  int musicSize;
  int albumSize;
  String briefDesc;
  String img1v1Url;
  String trans;
  String picUrl;
  String name;
  int id;
  String img1v1IdStr;

  Artists(
      {this.img1v1Id,
      this.topicPerson,
      this.followed,
      this.picId,
      this.musicSize,
      this.albumSize,
      this.briefDesc,
      this.img1v1Url,
      this.trans,
      this.picUrl,
      this.name,
      this.id,
      this.img1v1IdStr});

  Artists.fromJson(Map<String, dynamic> json) {
    img1v1Id = json['img1v1Id'];
    topicPerson = json['topicPerson'];
    followed = json['followed'];
    picId = json['picId'];
    musicSize = json['musicSize'];
    albumSize = json['albumSize'];
    briefDesc = json['briefDesc'];
    img1v1Url = json['img1v1Url'];
    trans = json['trans'];
    picUrl = json['picUrl'];
    name = json['name'];
    id = json['id'];
    img1v1IdStr = json['img1v1Id_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img1v1Id'] = this.img1v1Id;
    data['topicPerson'] = this.topicPerson;
    data['followed'] = this.followed;
    data['picId'] = this.picId;
    data['musicSize'] = this.musicSize;
    data['albumSize'] = this.albumSize;
    data['briefDesc'] = this.briefDesc;
    data['img1v1Url'] = this.img1v1Url;
    data['trans'] = this.trans;
    data['picUrl'] = this.picUrl;
    data['name'] = this.name;
    data['id'] = this.id;
    data['img1v1Id_str'] = this.img1v1IdStr;
    return data;
  }
}

class Artist {
  int img1v1Id;
  int topicPerson;
  bool followed;
  int picId;
  int musicSize;
  int albumSize;
  String briefDesc;
  String img1v1Url;
  String trans;
  String picUrl;
  String name;
  int id;
  String picIdStr;
  String img1v1IdStr;

  Artist(
      {this.img1v1Id,
      this.topicPerson,
      this.followed,
      this.picId,
      this.musicSize,
      this.albumSize,
      this.briefDesc,
      this.img1v1Url,
      this.trans,
      this.picUrl,
      this.name,
      this.id,
      this.picIdStr,
      this.img1v1IdStr});

  Artist.fromJson(Map<String, dynamic> json) {
    img1v1Id = json['img1v1Id'];
    topicPerson = json['topicPerson'];
    followed = json['followed'];
    picId = json['picId'];
    musicSize = json['musicSize'];
    albumSize = json['albumSize'];
    briefDesc = json['briefDesc'];
    img1v1Url = json['img1v1Url'];
    trans = json['trans'];
    picUrl = json['picUrl'];
    name = json['name'];
    id = json['id'];
    picIdStr = json['picId_str'];
    img1v1IdStr = json['img1v1Id_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img1v1Id'] = this.img1v1Id;
    data['topicPerson'] = this.topicPerson;
    data['followed'] = this.followed;
    data['picId'] = this.picId;
    data['musicSize'] = this.musicSize;
    data['albumSize'] = this.albumSize;
    data['briefDesc'] = this.briefDesc;
    data['img1v1Url'] = this.img1v1Url;
    data['trans'] = this.trans;
    data['picUrl'] = this.picUrl;
    data['name'] = this.name;
    data['id'] = this.id;
    data['picId_str'] = this.picIdStr;
    data['img1v1Id_str'] = this.img1v1IdStr;
    return data;
  }
}
