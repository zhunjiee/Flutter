/**
 * @ClassName home_model
 * @Description 首页模型
 * @Author Houge
 * @Date 2020/7/16 9:26 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class HomeModel {
  List<Slides> slides;
  ShopInfo shopInfo;
  IntegralMallPic integralMallPic;
  IntegralMallPic toShareCode;
  List<Recommend> recommend;
  IntegralMallPic advertesPicture;
  List<Floor1> floor1;
  List<Floor1> floor2;
  List<Floor1> floor3;
  IntegralMallPic saoma;
  IntegralMallPic newUser;
  IntegralMallPic floor1Pic;
  IntegralMallPic floor2Pic;
  FloorName floorName;
  List<Category> category;
  IntegralMallPic floor3Pic;

  HomeModel(
      {this.slides,
        this.shopInfo,
        this.integralMallPic,
        this.toShareCode,
        this.recommend,
        this.advertesPicture,
        this.floor1,
        this.floor2,
        this.floor3,
        this.saoma,
        this.newUser,
        this.floor1Pic,
        this.floor2Pic,
        this.floorName,
        this.category,
        this.floor3Pic});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['slides'] != null) {
      slides = new List<Slides>();
      json['slides'].forEach((v) {
        slides.add(new Slides.fromJson(v));
      });
    }
    shopInfo = json['shopInfo'] != null
        ? new ShopInfo.fromJson(json['shopInfo'])
        : null;
    integralMallPic = json['integralMallPic'] != null
        ? new IntegralMallPic.fromJson(json['integralMallPic'])
        : null;
    toShareCode = json['toShareCode'] != null
        ? new IntegralMallPic.fromJson(json['toShareCode'])
        : null;
    if (json['recommend'] != null) {
      recommend = new List<Recommend>();
      json['recommend'].forEach((v) {
        recommend.add(new Recommend.fromJson(v));
      });
    }
    advertesPicture = json['advertesPicture'] != null
        ? new IntegralMallPic.fromJson(json['advertesPicture'])
        : null;
    if (json['floor1'] != null) {
      floor1 = new List<Floor1>();
      json['floor1'].forEach((v) {
        floor1.add(new Floor1.fromJson(v));
      });
    }
    if (json['floor2'] != null) {
      floor2 = new List<Floor1>();
      json['floor2'].forEach((v) {
        floor2.add(new Floor1.fromJson(v));
      });
    }
    if (json['floor3'] != null) {
      floor3 = new List<Floor1>();
      json['floor3'].forEach((v) {
        floor3.add(new Floor1.fromJson(v));
      });
    }
    saoma = json['saoma'] != null
        ? new IntegralMallPic.fromJson(json['saoma'])
        : null;
    newUser = json['newUser'] != null
        ? new IntegralMallPic.fromJson(json['newUser'])
        : null;
    floor1Pic = json['floor1Pic'] != null
        ? new IntegralMallPic.fromJson(json['floor1Pic'])
        : null;
    floor2Pic = json['floor2Pic'] != null
        ? new IntegralMallPic.fromJson(json['floor2Pic'])
        : null;
    floorName = json['floorName'] != null
        ? new FloorName.fromJson(json['floorName'])
        : null;
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
    floor3Pic = json['floor3Pic'] != null
        ? new IntegralMallPic.fromJson(json['floor3Pic'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slides != null) {
      data['slides'] = this.slides.map((v) => v.toJson()).toList();
    }
    if (this.shopInfo != null) {
      data['shopInfo'] = this.shopInfo.toJson();
    }
    if (this.integralMallPic != null) {
      data['integralMallPic'] = this.integralMallPic.toJson();
    }
    if (this.toShareCode != null) {
      data['toShareCode'] = this.toShareCode.toJson();
    }
    if (this.recommend != null) {
      data['recommend'] = this.recommend.map((v) => v.toJson()).toList();
    }
    if (this.advertesPicture != null) {
      data['advertesPicture'] = this.advertesPicture.toJson();
    }
    if (this.floor1 != null) {
      data['floor1'] = this.floor1.map((v) => v.toJson()).toList();
    }
    if (this.floor2 != null) {
      data['floor2'] = this.floor2.map((v) => v.toJson()).toList();
    }
    if (this.floor3 != null) {
      data['floor3'] = this.floor3.map((v) => v.toJson()).toList();
    }
    if (this.saoma != null) {
      data['saoma'] = this.saoma.toJson();
    }
    if (this.newUser != null) {
      data['newUser'] = this.newUser.toJson();
    }
    if (this.floor1Pic != null) {
      data['floor1Pic'] = this.floor1Pic.toJson();
    }
    if (this.floor2Pic != null) {
      data['floor2Pic'] = this.floor2Pic.toJson();
    }
    if (this.floorName != null) {
      data['floorName'] = this.floorName.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    if (this.floor3Pic != null) {
      data['floor3Pic'] = this.floor3Pic.toJson();
    }
    return data;
  }
}

class Slides {
  String image;
  int urlType;
  String goodsId;

  Slides({this.image, this.urlType, this.goodsId});

  Slides.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    urlType = json['urlType'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['urlType'] = this.urlType;
    data['goodsId'] = this.goodsId;
    return data;
  }
}

class ShopInfo {
  String sHOPCODE;
  String leaderPhone;
  String leaderImage;
  String sHOPNAME;

  ShopInfo({this.sHOPCODE, this.leaderPhone, this.leaderImage, this.sHOPNAME});

  ShopInfo.fromJson(Map<String, dynamic> json) {
    sHOPCODE = json['SHOP_CODE'];
    leaderPhone = json['leaderPhone'];
    leaderImage = json['leaderImage'];
    sHOPNAME = json['SHOP_NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SHOP_CODE'] = this.sHOPCODE;
    data['leaderPhone'] = this.leaderPhone;
    data['leaderImage'] = this.leaderImage;
    data['SHOP_NAME'] = this.sHOPNAME;
    return data;
  }
}

class IntegralMallPic {
  String pictureAddress;
  String toPlace;
  int urlType;

  IntegralMallPic({this.pictureAddress, this.toPlace, this.urlType});

  IntegralMallPic.fromJson(Map<String, dynamic> json) {
    pictureAddress = json['PICTURE_ADDRESS'];
    toPlace = json['TO_PLACE'];
    urlType = json['urlType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PICTURE_ADDRESS'] = this.pictureAddress;
    data['TO_PLACE'] = this.toPlace;
    data['urlType'] = this.urlType;
    return data;
  }
}

class Recommend {
  String image;
  double mallPrice;
  String goodsName;
  String giftCouponsOffline;
  String goodsId;
  double price;

  Recommend(
      {this.image,
        this.mallPrice,
        this.goodsName,
        this.giftCouponsOffline,
        this.goodsId,
        this.price});

  Recommend.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    mallPrice = json['mallPrice'];
    goodsName = json['goodsName'];
    giftCouponsOffline = json['gift_coupons_offline'];
    goodsId = json['goodsId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['mallPrice'] = this.mallPrice;
    data['goodsName'] = this.goodsName;
    data['gift_coupons_offline'] = this.giftCouponsOffline;
    data['goodsId'] = this.goodsId;
    data['price'] = this.price;
    return data;
  }
}

class Floor1 {
  String image;
  String goodsId;

  Floor1({this.image, this.goodsId});

  Floor1.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['goodsId'] = this.goodsId;
    return data;
  }
}

class FloorName {
  String floor1;
  String floor2;
  String floor3;

  FloorName({this.floor1, this.floor2, this.floor3});

  FloorName.fromJson(Map<String, dynamic> json) {
    floor1 = json['floor1'];
    floor2 = json['floor2'];
    floor3 = json['floor3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floor1'] = this.floor1;
    data['floor2'] = this.floor2;
    data['floor3'] = this.floor3;
    return data;
  }
}

class Category {
  String mallCategoryId;
  String mallCategoryName;
  List<BxMallSubDto> bxMallSubDto;
  Null comments;
  String image;

  Category(
      {this.mallCategoryId,
        this.mallCategoryName,
        this.bxMallSubDto,
        this.comments,
        this.image});

  Category.fromJson(Map<String, dynamic> json) {
    mallCategoryId = json['mallCategoryId'];
    mallCategoryName = json['mallCategoryName'];
    if (json['bxMallSubDto'] != null) {
      bxMallSubDto = new List<BxMallSubDto>();
      json['bxMallSubDto'].forEach((v) {
        bxMallSubDto.add(new BxMallSubDto.fromJson(v));
      });
    }
    comments = json['comments'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallCategoryName'] = this.mallCategoryName;
    if (this.bxMallSubDto != null) {
      data['bxMallSubDto'] = this.bxMallSubDto.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    data['image'] = this.image;
    return data;
  }
}

class BxMallSubDto {
  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  BxMallSubDto(
      {this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments});

  BxMallSubDto.fromJson(Map<String, dynamic> json) {
    mallSubId = json['mallSubId'];
    mallCategoryId = json['mallCategoryId'];
    mallSubName = json['mallSubName'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this.mallSubId;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubName'] = this.mallSubName;
    data['comments'] = this.comments;
    return data;
  }
}

/*
* 热门商品
* */
class HotGoodsModel {
  String name;
  String image;
  double mallPrice;
  String goodsId;
  double price;

  HotGoodsModel(
      {this.name, this.image, this.mallPrice, this.goodsId, this.price});

  HotGoodsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    mallPrice = json['mallPrice'];
    goodsId = json['goodsId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['mallPrice'] = this.mallPrice;
    data['goodsId'] = this.goodsId;
    data['price'] = this.price;
    return data;
  }
}

