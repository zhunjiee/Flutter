/**
 * @ClassName common_color
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/23 5:34 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class CommonColor {
  static final Color primaryColor = const Color(0xff8879f2);
  static final Color toastBlackBgColor = const Color(0xA6000000);//可设置透明度 A6
  static const Color transparent = Color(0x00000000);

  static Color appBlueColor = const Color(0xff46B6FF);
  static Color appBlue1Color = const Color(0xff1048FF);

  static Color grayf5f5f5 = const Color(0xffd9d9d9);


  /// 字符串转颜色对象 Color
  static Color getColor(String colorStr) {
    if (colorStr.isNotEmpty) {
      if (colorStr.substring(0, 1) != "#") {
        return primaryColor;
      }
      String subStr = colorStr.substring(1, colorStr.length);
      return Color(int.parse("0xff" + subStr));
    }

    return primaryColor;
  }
}