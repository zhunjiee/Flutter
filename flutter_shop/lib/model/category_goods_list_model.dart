/**
 * @ClassName category_goods_list_model
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-08 13:06
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class CategoryGoodsListModel {
  List<CategoryGoodsModel> goodsList;

  CategoryGoodsListModel({
    this.goodsList,
  });

  CategoryGoodsListModel.fromList(List list) {
    if (list != null) {
      goodsList = new List<CategoryGoodsModel>();
      list.forEach((v) {
        goodsList.add(new CategoryGoodsModel.fromJson(v));
      });
    }
  }
}

class CategoryGoodsModel {
  String image;
  double oriPrice;
  double presentPrice;
  String goodsName;
  String goodsId;

  CategoryGoodsModel({
    this.image,
    this.oriPrice,
    this.presentPrice,
    this.goodsName,
    this.goodsId,
  });

  CategoryGoodsModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    goodsName = json['goodsName'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['goodsName'] = this.goodsName;
    data['goodsId'] = this.goodsId;
    return data;
  }
}
