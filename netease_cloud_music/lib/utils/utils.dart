/**
 * @ClassName utils
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-21 16:34
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  // 显示Toast提示信息
  static void showToast(String msg) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }
}
