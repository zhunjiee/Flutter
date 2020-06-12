/**
 * @ClassName navigation_utils
 * @Description TODO
 * @Author Houge
 * @Date 2020/6/12 9:24 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:fluttershop2/routers/routes.dart';
import '../application.dart';

class NavigationUtils {
  /*
  * 跳转方法
  * */
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

  /*
  * 跳转到首页
  * */
  static void goHomePage(BuildContext context) {
    _navigateTo(context, Routes.homePage, clearStack: true);
  }
}
