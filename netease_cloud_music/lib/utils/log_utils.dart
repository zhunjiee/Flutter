/**
 * @ClassName log_util
 * @Description 日志打印工具类
 * @Author HouGe
 * @Date 2020-02-21 16:31
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class LogUtils {
  static const String _TAG_DEFINE = "###common_utils###";
  static bool debuggable = false; // 是否是debug模式, 默认false

  static String TAG = _TAG_DEFINE;

  static void init({bool isDebug = false, String tag = _TAG_DEFINE}) {
    debuggable = isDebug;
    TAG = tag;
  }

  static void e(Object object, {String tag}) {
    _printLog(tag, ": ", object);
  }

  static void v(Object object, {String tag}) {
    if (debuggable) {
      _printLog(tag, ": ", object);
    }
  }

  static void _printLog(String tag, String stag, Object object) {
    String objStr = object.toString();
    String _tag = (tag == null || tag.isEmpty) ? TAG : tag;

    while (objStr.isNotEmpty) {
      if (objStr.length > 1024) {
        print("$_tag $stag ${objStr.substring(0, 1024)}");
        objStr = objStr.substring(1024, objStr.length);
      } else {
        print("$_tag $stag $objStr");
        objStr = "";
      }
    }
  }
}
