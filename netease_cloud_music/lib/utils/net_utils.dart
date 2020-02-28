import 'dart:convert';

/**
 * @ClassName net_utils
 * @Description 网路请求类
 * @Author HouGe
 * @Date 2020-02-19 23:08
 * @Version 1.0
 */

import 'package:flutter/cupertino.dart';
import 'dart:io' show Directory;
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'http_request.dart';
import 'common_url.dart';
import 'utils.dart';
import 'custom_log_interceptor.dart';
import '../routes/navigate_service.dart';
import '../routes/routes.dart';
import '../widgets/widget_loading.dart';
import '../application.dart';
import '../model/user_model.dart';
import '../model/banner_model.dart';
import '../model/recommend_playlist_model.dart';

class NetUtils {
  HttpRequest _request;

  // 单例
  static final NetUtils _instance = NetUtils._internal();

  factory NetUtils() => _instance; // 工厂模式

  NetUtils._internal() {
    // 初始化
    if (null == _request) {
      _request = HttpRequest();
    }
  }

  /// 登录
  Future<UserModel> login(
    BuildContext context,
    String phone,
    String password,
  ) async {
    var params = {
      "phone": phone,
      "password": password,
    };
    Response response =
        await _request.get(context, CommonUrl.loginAPI, params: params);
    return UserModel.fromJson(response.data);
  }

  /// 重新登录
  Future<Response> refreshLogin(BuildContext context) async {
    return await _request
        .get(context, CommonUrl.refreshLoginAPI, isShowLoading: false)
        .catchError((e) {
      Utils.showToast("网络错误!");
    });
  }

  /// 首页广告轮播图
  Future<BannerModel> getBanner(BuildContext context) async {
    var params = {
      "type": 1,
    };
    Response response =
        await _request.get(context, CommonUrl.bannerAPI, params: params, isShowLoading: false);
    return BannerModel.fromJson(response.data);
  }

  /// 推荐歌单
  Future<RecommendPlaylistModel> getRecommendPlaylist(BuildContext context) async {
    Response response = await _request.get(context, CommonUrl.recommendAPI, isShowLoading: false);
    RecommendPlaylistModel model = RecommendPlaylistModel.fromJson(response.data);
    print("-------------$model");
    return model;
  }
}
