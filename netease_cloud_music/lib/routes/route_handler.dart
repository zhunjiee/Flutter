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
import '../model/recommend_playlist_model.dart';

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
  String data = parameters["data"].first;
  // String 转 Map
  Map recommend = FluroConvertUtils.string2map(data);
  return PlaylistPage(Recommend.fromJson(recommend));
});
