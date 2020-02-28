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
import '../utils/utils.dart';
import '../utils/net_utils.dart';

class UserProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  /// 初始化用户信息
  initUserInfo() {
    if (Application.sharedPreferences.containsKey("user")) {
      String userString = Application.sharedPreferences.getString("user");
      _user = UserModel.fromJson(json.decode(userString));
    } else {
      print("没有用户信息");
    }
  }

  /// 网络获取用户信息
  Future<UserModel> getUserInfo(BuildContext context, String phone, String password) async {
    if (phone.length == 0) {
      Utils.showToast("请输入手机号码");
      return null;
    } else if (password.length == 0) {
      Utils.showToast("请输入密码");
      return null;
    }

    UserModel user = await NetUtils().login(context, phone, password);
    if (user.code > 299) {
      Utils.showToast(user.msg ?? '登录失败，请检查账号密码');
      return null;
    }
    Utils.showToast(user.msg ?? '登录成功');
    _saveUserInfo(user);
    return user;
  }

  /// 存储用户信息
  _saveUserInfo(UserModel model) {
    _user = model;
    Application.sharedPreferences.setString(
      "user",
      json.encode(model.toJson()),
    );
  }
}
