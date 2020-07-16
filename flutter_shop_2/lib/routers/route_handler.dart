import 'package:fluro/fluro.dart';
/**
 * @ClassName route_handler
 * @Description TODO
 * @Author Houge
 * @Date 2020/6/12 9:12 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../pages/index_page.dart';

/*
* 首页
* */
Handler homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
    return IndexPage();
  }
);