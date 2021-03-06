/**
 * @ClassName http_request
 * @Description 网络请求接口
 * @Author HouGe
 * @Date 2020-02-24 15:19
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class CommonUrl {
  // 服务器地址
  static const String baseUrl = "http://118.24.63.15:1020";


  // 登录
  static const String loginAPI = baseUrl + "/login/cellphone";

  // 重新登录
  static const String refreshLoginAPI = baseUrl + "/login/refresh";

  // 首页广告轮播图
  static const String bannerAPI = baseUrl + "/banner";

  // 推荐歌单
  static const String recommendAPI = baseUrl + "/recommend/resource";

  // 新碟上架
  static const String newAlbumAPI = baseUrl + "/top/album";

  // MV排行
  static const String topMvAPI = baseUrl + "/top/mv";

  // 歌单详情
  static const String playlistDetailAPI = baseUrl + "/playlist/detail";

  // 每日推荐
  static const String dailySongsAPI = baseUrl + "/recommend/songs";

  // 排行榜
  static const String topListAPI = baseUrl + "/toplist/detail";

  // 歌词
  static const String lyricAPI = baseUrl + "/lyric";

  // 我的-歌单
  static const String minePlaylistAPI = baseUrl + "/user/playlist";
}