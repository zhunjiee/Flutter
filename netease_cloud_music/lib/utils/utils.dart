import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
/**
 * @ClassName utils
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-21 16:34
 * @Version 1.0
 */

import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  /// 显示Toast提示信息
  static void showToast(String msg) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }

  /// 显示网络图片,带缓存功能
  static Widget showNetImage(String url,
      {double width, double height, BoxFit fit}) {
    return Image(
      image: ExtendedNetworkImageProvider(url, cache: true),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
