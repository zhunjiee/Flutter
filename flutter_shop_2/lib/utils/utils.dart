/// @ClassName utils
/// @Description 常用工具类
/// @Author Houge
/// @Date 2020/7/17 9:23 AM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  /// 显示Toast提示信息
  static void showToast(String msg) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }


}
