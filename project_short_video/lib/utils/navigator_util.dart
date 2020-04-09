/**
 * @ClassName navigator_util
 * @Description TODO
 * @Author houge
 * @Date 2020/4/9 9:47 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:projectshortvideo/application.dart';

class NavigatorUtil {
  /// 跳转方法
  static void _navigateTo(BuildContext context, String path) {
    Application.router.navigateTo(context, path);
  }
}