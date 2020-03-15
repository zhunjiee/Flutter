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
import '../model/lyric_model.dart';

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

  /// 格式化歌词
  static List<Lyric> formatLyric(String lyricStr) {
    // ^字符串开始
    // \[ : [
    // \d : 数字
    // {2} : 连续2个
    // 查找以 [ 开头,并且后面连续2个数字的 字符串, 如: [00:19.38]原谅我真的喝醉了
    RegExp reg = RegExp(r"^\[\d{2}");

    List<Lyric> result =
        lyricStr.split("\n").where((r) => reg.hasMatch(r)).map((s) {
      /// 歌词
      String lyric = s.substring(s.indexOf(']') + 1);

      /// 开始时间
      String time = s.substring(1, s.indexOf(']') - 1);
      int minuteSeparatorIndex = time.indexOf(":");
      int secondSeparatorIndex = time.indexOf(".");
      // 组装开始时间
      Duration startTime = Duration(
        minutes: int.parse(time.substring(0, minuteSeparatorIndex)),
        seconds: int.parse(
            time.substring(minuteSeparatorIndex + 1, secondSeparatorIndex)),
        milliseconds: int.parse(time.substring(secondSeparatorIndex + 1)),
      );
      return Lyric(
        lyric,
        startTime: startTime,
      );
    }).toList();

    /// 结束时间
    for (int i = 0; i < result.length - 1; i++) {
      result[i].endTime = result[i + 1].startTime;
    }
    result[result.length - 1].endTime = Duration(hours: 1);
    return result;
  }

  /// 查找歌词
  static int findLyricIndex(double curDuration, List<Lyric> lyrics) {
    for (int i = 0; i < lyrics.length; i++) {
      if (curDuration >= lyrics[i].startTime.inMilliseconds &&
          curDuration <= lyrics[i].endTime.inMilliseconds) {
        return i;
      }
    }
    return 0;
  }
}
