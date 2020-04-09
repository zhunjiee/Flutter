/**
 * @ClassName routes
 * @Description TODO
 * @Author houge
 * @Date 2020/4/9 9:02 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'route_handler.dart';

class Routes {
  static final String root = "/";
  static final String homePage = "/index";

  static void configRoutes(Router router) {
    // 没有找到路由的统一配置
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      print("ERROR =======> ROUTE NOT FOUND!!!");
      return Scaffold(
        body: Container(
          child: Center(
            child: Text("没有找到路由!!!"),
          ),
        ),
      );
    });

    router.define(root, handler: splashHandler);
    router.define(homePage, handler: homeHandler);
  }


}
