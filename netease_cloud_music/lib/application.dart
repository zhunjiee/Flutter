/**
 * @ClassName application
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-22 18:23
 * @Version 1.0
 */

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'routes/navigate_service.dart';

class Application {
  static Router router;
  // Service Locator 可以将接口（抽象基类）与具体实现分离，同时允许通过接口从App中的任何位置访问具体实现。
  // 实现无 context 导航
  static GlobalKey<NavigatorState> key = GlobalKey();
  static GetIt getIt = GetIt.instance;

  static setupLocator() {
    getIt.registerSingleton(NavigateService());
  }
}