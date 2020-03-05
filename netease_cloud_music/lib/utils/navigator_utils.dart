/**
 * @ClassName navigator_utils
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-23 14:47
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:netease_cloud_music/model/recommend_playlist_model.dart';
import 'package:netease_cloud_music/routes/routes.dart';
import 'package:netease_cloud_music/utils/fluro_convert_utils.dart';
import '../application.dart';

class NavigatorUtils {
  // 跳转方法
  static void _navigateTo(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    Duration transitionDuration = const Duration(milliseconds: 250),
    RouteTransitionsBuilder transitionBuilder,
  }) {
    Application.router.navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      transition: TransitionType.material,
    );
  }

  /// 跳转到登录页
  static void goLoginPage(BuildContext context) {
    _navigateTo(context, Routes.loginPage, clearStack: true);
  }

  /// 跳转到首页
  static void goHomePage(BuildContext context) {
    _navigateTo(context, Routes.homePage, clearStack: true);
  }

  /// 跳转到歌单详情
  static void goPlaylistDetailPage(BuildContext context, Recommend data) {
    String recommend = FluroConvertUtils.object2string(data);
    _navigateTo(context, "${Routes.playlistPage}?data=$recommend");
  }

  /// 跳转到每日推荐
  static void goDailySongsPage(BuildContext context) {
    _navigateTo(context, Routes.dailySongsPage);
  }

  /// 跳转到排行榜
  static void goTopListPage(BuildContext context) {
    _navigateTo(context, Routes.topListPage);
  }
}
