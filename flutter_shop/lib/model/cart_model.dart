/**
 * @ClassName cart_model
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-15 13:43
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class CartModel {
  String goodsId;
  String goodsName;
  int count;
  double price;
  String images;
  bool isSelected;  // 是否选中

  CartModel({this.goodsId, this.goodsName, this.count, this.price, this.images, this.isSelected});

  CartModel.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
    count = json['count'];
    price = json['price'];
    images = json['images'];
    isSelected = json["isSelected"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['count'] = this.count;
    data['price'] = this.price;
    data['images'] = this.images;
    data["isSelected"] = this.isSelected;
    return data;
  }
}
