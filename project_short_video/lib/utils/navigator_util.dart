import 'package:fluro/fluro.dart';
/**
 * @ClassName navigator_util
 * @Description TODO
 * @Author houge
 * @Date 2020/4/9 9:47 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../routes/routes.dart';
import 'package:projectshortvideo/application.dart';
import '../pages/index_page.dart';

class NavigatorUtil {
  /// 跳转方法
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

  /// 跳转到首页
  static void goHomePage(BuildContext context) {
    _navigateTo(context, Routes.homePage, clearStack: true);
  }
}
