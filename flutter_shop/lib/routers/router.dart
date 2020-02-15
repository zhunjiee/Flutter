/**
 * @ClassName router
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-12 10:54
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';

class Routes {
  static String root = "/";
  static String detailPage = "/detail";
  static String cartPage = "/cart";

  static void configureRoutes(Router router){
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        print("ERROR =======> ROUTE NOT FOUND!!!");
        return Text("ERROR =======> ROUTE NOT FOUND!!!");
      }
    );

    router.define(detailPage, handler: detailHandler);
    router.define(cartPage, handler: cartHandler);
  }
}