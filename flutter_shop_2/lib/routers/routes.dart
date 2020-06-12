/**
 * @ClassName routes
 * @Description TODO
 * @Author Houge
 * @Date 2020/6/12 9:05 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'route_handler.dart';
import '../pages/login/login_page.dart';

class Routes {
  static final String homePage = "/index";

  static void configRoutes(Router router) {
    // 没有找到路由的统一配置
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
        print("ERROR =======> ROUTE NOT FOUND!!!");
        // 没有找到路由,统一跳到登录页面
        return LoginPage();
      }
    );

    router.define(homePage, handler: homeHandler);
  }
}