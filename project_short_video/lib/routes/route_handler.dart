/**
 * @ClassName route_handler
 * @Description TODO
 * @Author houge
 * @Date 2020/4/9 9:02 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:projectshortvideo/pages/index_page.dart';
import 'package:projectshortvideo/pages/splash_page.dart';

Handler splashHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
    return SplashPage();
  }
);

Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return IndexPage();
    }
);