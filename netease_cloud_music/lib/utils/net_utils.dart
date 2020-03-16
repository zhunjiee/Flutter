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
import '../model/recommend_model.dart';
import '../model/album_model.dart';
import '../model/mv_model.dart';
import '../model/playlist_model.dart';
import '../model/daily_songs_model.dart';
import '../model/top_list_model.dart';
import '../model/lyric_model.dart';
import '../model/mine_playlist_model.dart';

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
    Response response = await _request.get(CommonUrl.loginAPI,
        params: params, context: context, isShowLoading: true);
    return UserModel.fromJson(response.data);
  }

  /// 重新登录
  Future<Response> refreshLogin() async {
    return await _request.get(CommonUrl.refreshLoginAPI).catchError((e) {
      Utils.showToast("网络错误!");
    });
  }

  /// 首页广告轮播图
  Future<BannerModel> getBanner() async {
    var params = {
      "type": 1,
    };
    Response response = await _request.get(CommonUrl.bannerAPI, params: params);
    return BannerModel.fromJson(response.data);
  }

  /// 推荐歌单
  Future<RecommendPlaylistModel> getRecommendPlaylist() async {
    Response response = await _request.get(CommonUrl.recommendAPI);
    return RecommendPlaylistModel.fromJson(response.data);
  }

  /// 新碟上架
  Future<AlbumModel> getAlbumData({
    Map<String, dynamic> params = const {
      "offset": 1,
      "limit": 10,
    },
  }) async {
    Response response =
        await _request.get(CommonUrl.newAlbumAPI, params: params);
    return AlbumModel.fromJson(response.data);
  }

  /// MV排行
  Future<MvModel> getTopMvData({
    Map<String, dynamic> params = const {
      "offset": 1,
      "limit": 10,
    },
  }) async {
    Response response = await _request.get(CommonUrl.topMvAPI, params: params);
    return MvModel.fromJson(response.data);
  }

  /// 歌单详情
  Future<PlaylistModel> getPlaylistDetailData(int playlistId) async {
    var params = {"id": playlistId};
    Response response =
        await _request.get(CommonUrl.playlistDetailAPI, params: params);
    PlaylistModel model = PlaylistModel.fromJson(response.data);
    return model;
  }

  /// 每日推荐
  Future<DailySongsModel> getDailySongsData() async {
    Response response = await _request.get(CommonUrl.dailySongsAPI);
    DailySongsModel model = DailySongsModel.fromJson(response.data);
    return model;
  }

  /// 排行榜
  Future<TopListModel> getTopListData() async {
    Response response = await _request.get(CommonUrl.topListAPI);
    return TopListModel.fromJson(response.data);
  }

  /// 歌词
  Future<LyricModel> getLyricData(int id) async {
    var params = {'id': id};
    Response response = await _request.get(CommonUrl.lyricAPI, params: params);
    LyricModel model = LyricModel.fromJson(response.data);
    return model;
  }

  /// 我的 - 歌单
  Future<MinePlaylistModel> getMinePlaylistData(int userId) async {
    var params = {'uid': userId};
    Response response =
        await _request.get(CommonUrl.minePlaylistAPI, params: params);
    MinePlaylistModel model = MinePlaylistModel.fromJson(response.data);
    print("请求数据到了");
    return model;
  }
}
