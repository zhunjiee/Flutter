/**
 * @ClassName navigation_util
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/25 11:07 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../routes/routes.dart';
import '../application.dart';

class NavigationUtil {
  static void _navigateTo(BuildContext context, String path) {
    Application.router.navigateTo(context, path);
  }

  /// 跳转到聊天界面
  static void goChatPage(BuildContext context) {
    _navigateTo(context, Routes.chatPage);
  }
}