/**
 * @ClassName router_handler
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-22 18:26
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../utils/fluro_convert_utils.dart';
import '../pages/splash_page.dart';
import '../pages/index_page.dart';
import '../pages/login/login_page.dart';
import '../pages/playlist/playlist_page.dart';
import '../model/recommend_model.dart';
import '../pages/daily_songs/daily_songs_page.dart';
import '../pages/top_list/top_list_page.dart';
import '../pages/play_music/play_music_page.dart';

/// 启动页
Handler splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return SplashPage();
});

/// 登录页
Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LoginPage();
});

/// 首页
Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return IndexPage();
});

/// 播放列表
Handler playlistHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  String dataString = parameters["data"].first;
  Map dataMap = FluroConvertUtils.string2map(dataString);
  return PlaylistPage(Recommend.fromJson(dataMap));
});

/// 每日推荐
Handler dailySongsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return DailySongsPage();
});

/// 排行榜
Handler topListHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return TopListPage();
});

/// 播放页面
Handler playMusicHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
    return PlayMusicPage();
  }
);