/**
 * @ClassName router
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-22 18:26
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'route_handler.dart';
import 'package:netease_cloud_music/pages/login/login_page.dart';

class Routes {
  static final String root = "/";
  static final String loginPage = "/login";
  static final String homePage = "/home";

  static void configRoutes(Router router) {
    // 没有找到路由的统一配置
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> parameters) {
          print("ERROR =======> ROUTE NOT FOUND!!!");
          return LoginPage(); // 没有找到路由,统一跳到登录页面
        }
    );

    router.define(root, handler: splashHandler);
    router.define(loginPage, handler: loginHandler);
    router.define(homePage, handler: homeHandler);
  }
}