/**
 * @ClassName widget_img_menu
 * @Description 播放页单个歌曲操作(例:喜欢/下载)按钮
 * @Author houge
 * @Date 2020/3/9 10:52 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageMenuWidget extends StatelessWidget {
  ImageMenuWidget(
    this.src, {
    this.size = 100,
    this.onTap,
  });

  final String src;
  final double size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          src,
          width: ScreenUtil().setWidth(size),
          height: ScreenUtil().setWidth(size),
        ),
      ),
    );
  }
}
