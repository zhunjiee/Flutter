/**
 * @ClassName NavigateService
 * @Description 导航相关的功能封装,方便 Application 中ServiceLocator注册
 * @Author HouGe
 * @Date 2020-02-22 22:25
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class NavigateService {
  final GlobalKey<NavigatorState> key = GlobalKey(debugLabel: "navigate_key");

  // 通过 key.currentState 获取到 NavigatorState 实例
  NavigatorState get navigator => key.currentState;

  get pushNamed => navigator.pushNamed;
  get push => navigator.push;
  get popAndPushNamed => navigator.popAndPushNamed;
}