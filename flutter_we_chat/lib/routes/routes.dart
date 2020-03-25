/**
 * @ClassName routes
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/25 10:52 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';

class Routes {
  static final String chatPage = "/chat";

  static void configRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        print("ERROR =======> ROUTE NOT FOUND!!!");
        return Text("ERROR =======> ROUTE NOT FOUND!!!");
      }
    );


    router.define(chatPage, handler: chatHandler);
  }
}