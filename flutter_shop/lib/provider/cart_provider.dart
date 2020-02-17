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

  int allCount = 0; // 商品总数量
  double allPrice = 0; // 总价格
  bool allSelected = true; // 是否全部选中

  // 存储
  save(String goodsId, String goodsName, int count, double price,
      String images) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tempString = preferences.getString(cartInfo);

    bool isExist = false; // 要保存的数据是否已经存在
    int index = 0;
    // json字符串 转 List<Map>类型
    var temp = tempString == null ? [] : json.decode(tempString);
    List<Map> tempList = (temp as List).cast();

    allPrice = 0;
    allCount = 0;
    tempList.forEach((item) {
      CartModel cartModel = CartModel.fromJson(item);

      // 存在
      if (cartModel.goodsId == goodsId) {
        isExist = true;
        tempList[index]["count"] = cartModel.count + 1; // 存在个数+1
        cartList[index].count++;
      }
      if (cartModel.isSelected) {
        allCount += cartModel.count;
        allPrice += cartModel.count * cartModel.price;
      }
      index++;
    });
    // 不存在
    if (!isExist) {
      Map<String, dynamic> newGoods = {
        "goodsId": goodsId,
        "goodsName": goodsName,
        "count": count,
        "price": price,
        "images": images,
        "isSelected": true,
      };
      tempList.add(newGoods);
      cartList.add(CartModel.fromJson(newGoods));

      allCount += count;
      allPrice += count * price;
    }

    // List 转 json字符串
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

  // 获取购物车全部商品
  getCartInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cartString = preferences.getString(cartInfo);
    // 把cartList进行初始化，防止数据混乱
    cartList = [];
    if (cartString == null) {
      cartList = [];
    } else {
      List<Map> tempList = (json.decode(cartString) as List).cast();
      // 先置0再重新设置
      allCount = 0;
      allPrice = 0;
      allSelected = true;

      tempList.forEach((item) {
        CartModel model = CartModel.fromJson(item);
        if (model.isSelected) {
          allCount += model.count;
          allPrice += model.count * model.price;
        } else {
          allSelected = false;
        }

        cartList.add(CartModel.fromJson(item));
      });
    }

    notifyListeners();
  }

  // 删除单个商品
  deleteOneGoods(String goodsId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cartString = preferences.getString(cartInfo);
    int index = 0;
    int deleteIndex = 0;
    var temp = cartString == null ? [] : json.decode(cartString);
    List<Map> tempList = (temp as List).cast();

    tempList.forEach((item) {
      CartModel cartModel = CartModel.fromJson(item);
      if (cartModel.goodsId == goodsId) {
        deleteIndex = index;
      }
      index++;
    });
    tempList.removeAt(deleteIndex);
    // 转json字符串
    cartString = json.encode(tempList).toString();
    preferences.setString(cartInfo, cartString);

    await getCartInfo();
  }

  // 改变单个商品的选中状态
  changeOneGoodsSelectedStatus(CartModel itemModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cartString = preferences.getString(cartInfo);
    int index = 0;
    int changeIndex = 0;
    var temp = cartString == null ? [] : json.decode(cartString);
    List<Map> tempList = (temp as List).cast();

    tempList.forEach((item) {
      CartModel cartModel = CartModel.fromJson(item);
      if (cartModel.goodsId == itemModel.goodsId) {
        changeIndex = index;
      }
      index++;
    });
    tempList[changeIndex] = itemModel.toJson();
    cartString = json.encode(tempList).toString();
    preferences.setString(cartInfo, cartString);

    await getCartInfo();
  }

  // 修改全选状态
  changeAllGoodsSelectedStatus(bool status) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cartString = preferences.getString(cartInfo);

    var temp = cartString == null ? [] : json.decode(cartString);
    List<Map> tempList = (temp as List).cast();

    for (int i = 0; i < tempList.length; i++) {
      tempList[i]["isSelected"] = status;
    }

    cartString = json.encode(tempList).toString();
    preferences.setString(cartInfo, cartString);

    await getCartInfo();
  }

  // 商品加减管理
  // add: true增加商品 , false减少商品
  manageCount(CartModel itemModel, bool add) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cartString = preferences.getString(cartInfo);

    var temp = cartString == null ? [] : json.decode(cartString);
    List<Map> tempList = (temp as List).cast();

    int changeIndex = 0;

    for (int i = 0; i < tempList.length; i++) {
      CartModel cartModel = CartModel.fromJson(tempList[i]);
      if (cartModel.goodsId == itemModel.goodsId) {
        changeIndex = i;
        if (add) {
          itemModel.count++;
        } else if (cartModel.count > 1) {
          itemModel.count--;
        }
        break;
      }
    }

    tempList[changeIndex] = itemModel.toJson();
    cartString = json.encode(tempList).toString();
    preferences.setString(cartInfo, cartString);

    await getCartInfo();
  }
}
