/**
 * @ClassName cart_provider
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-15 13:39
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cart_model.dart';
import '../config/const_header.dart';
import 'dart:convert';

class CartProvider with ChangeNotifier {
  List<CartModel> cartList = [];

  // 存储
  save(CartModel model) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tempString = preferences.getString(cartInfo);

    bool isExist = false; // 要保存的数据是否已经存在
    int index = 0;

    var temp = tempString == null ? [] : json.decode(tempString);
    List<Map> tempList = (temp as List).cast();

    tempList.forEach((item) {
      CartModel cartModel = CartModel.fromJson(item);
      if (cartModel.goodsId == model.goodsId) {
        isExist = true;
        tempList[index]["count"] = cartModel.count + 1; // 存在个数+1
        cartList[index].count++;
      }
      index++;
    });

    if (!isExist) {
      Map<String, dynamic> newGoods = {
        "goodsId": model.goodsId,
        "goodsName": model.goodsName,
        "count": model.count,
        "price": model.price,
        "images": model.images,
      };
      tempList.add(newGoods);
      cartList.add(model);
    }

    String cartString = json.encode(tempList).toString();
    preferences.setString(cartInfo, cartString);

    print(cartString);
    print(cartList.toString());

    notifyListeners();
  }

  // 清空
  clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(cartInfo);
    cartList = [];
    print("清空购物车完成------------------");

    notifyListeners();
  }

  getCartInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cartString = preferences.getString(cartInfo);
    // 把cartList进行初始化，防止数据混乱
    cartList = [];
    if (cartString == null) {
      cartList = [];
    } else {
      List<Map> tempList = (json.decode(cartString) as List).cast();
      tempList.forEach((item) {
        cartList.add(CartModel.fromJson(item));
      });
    }

    notifyListeners();
  }
}
