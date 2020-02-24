/**
 * @ClassName net_utils
 * @Description 网路请求类
 * @Author HouGe
 * @Date 2020-02-19 23:08
 * @Version 1.0
 */

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:netease_cloud_music/model/user_model.dart';
import 'http_request.dart';
import 'common_url.dart';
import '../model/user_model.dart';

class NetUtils {
  HttpRequest http = HttpRequest();

  /// 登录
  Future<UserModel> login(BuildContext context, String phone, String password) async {
    var params = {
      "phone" : phone,
      "password" : password,
    };
    Response response = await http.get(context, loginAPI, params: params);
    return UserModel.fromJson(response.data);
  }
}
