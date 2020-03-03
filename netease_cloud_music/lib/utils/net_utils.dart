import 'dart:convert';

/**
 * @ClassName net_utils
 * @Description 网路请求类
 * @Author HouGe
 * @Date 2020-02-19 23:08
 * @Version 1.0
 */

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'http_request.dart';
import 'common_url.dart';
import 'utils.dart';
import '../model/user_model.dart';
import '../model/banner_model.dart';
import '../model/recommend_playlist_model.dart';
import '../model/album_model.dart';
import '../model/mv_model.dart';
import '../model/playlist_model.dart';

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
    Response response = await _request.get(context, CommonUrl.bannerAPI,
        params: params, isShowLoading: false);
    return BannerModel.fromJson(response.data);
  }

  /// 推荐歌单
  Future<RecommendPlaylistModel> getRecommendPlaylist(
      BuildContext context) async {
    Response response = await _request.get(context, CommonUrl.recommendAPI,
        isShowLoading: false);
    return RecommendPlaylistModel.fromJson(response.data);
  }

  /// 新碟上架
  Future<AlbumModel> getAlbumData(
    BuildContext context, {
    Map<String, dynamic> params = const {
      "offset": 1,
      "limit": 10,
    },
  }) async {
    Response response = await _request.get(context, CommonUrl.newAlbumAPI,
        params: params, isShowLoading: false);
    return AlbumModel.fromJson(response.data);
  }

  /// MV排行
  Future<MvModel> getTopMvData(
    BuildContext context, {
    Map<String, dynamic> params = const {
      "offset": 1,
      "limit": 10,
    },
  }) async {
    Response response = await _request.get(context, CommonUrl.topMvAPI,
        params: params, isShowLoading: false);
    return MvModel.fromJson(response.data);
  }

  /// 歌单详情
  Future<PlaylistModel> getPlaylistDetailData(
      BuildContext context, {Map<String, dynamic> params}) async {
    Response response = await _request.get(context, CommonUrl.playlistDetailAPI,
        params: params);
    return PlaylistModel.fromJson(response.data);
  }
}
