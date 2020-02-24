/**
 * @ClassName navigator_utils
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-23 14:47
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:netease_cloud_music/routes/routes.dart';
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
}