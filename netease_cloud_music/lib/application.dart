/**
 * @ClassName application
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-22 18:23
 * @Version 1.0
 */

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'routes/navigate_service.dart';

class Application {
  static Router router;

  static double screenWidth;
  static double screenHeight;
  static double statusBarHeight;  // 状态栏高度
  static double navigationBarHeight;  // 导航栏栏高度  系统自带: kToolbarHeight
  static double bottomBarHeight;  // 底部导航栏高度  系统自带: kBottomNavigationBarHeight

  static GlobalKey<NavigatorState> key = GlobalKey();
  // Service Locator 可以将接口（抽象基类）与具体实现分离，同时允许通过接口从App中的任何位置访问具体实现。
  // 实现无 context 导航
  static GetIt getIt = GetIt.instance;
  static setupLocator() {
    getIt.registerSingleton(NavigateService());
  }

  // SharedPreferences
  static SharedPreferences sharedPreferences;

  static initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}