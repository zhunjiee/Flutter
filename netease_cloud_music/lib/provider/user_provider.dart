/**
 * @ClassName user_provider
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-24 13:59
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/user_model.dart';
import '../application.dart';

class UserProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  /// 初始化用户信息
  void initUserInfo() {
    if (Application.sharedPreferences.containsKey("user")) {
      String userString = Application.sharedPreferences.getString("user");
      _user = UserModel.fromJson(json.decode(userString));
    } else {
        print("没有用户信息");
    }
  }

  /// 存储用户信息
  void saveUserInfo() {

  }
}