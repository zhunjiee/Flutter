/**
 * @ClassName router_handler
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-22 18:26
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/splash_page.dart';
import '../pages/index_page.dart';
import '../pages/login/login_page.dart';
import '../pages/discover/discover_page.dart';

/// 启动页
Handler splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> parameters) {
      return SplashPage();
    }
);

/// 登录页
Handler loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> parameters) {
    return LoginPage();
  }
);

/// 首页
Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> parameters) {
      return IndexPage();
    }
);