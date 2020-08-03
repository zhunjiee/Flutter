/// @ClassName widget_image
/// @Description TODO
/// @Author HouGe
/// @Date 2020/7/31 10:19 AM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetImageWidget extends StatelessWidget {
  NetImageWidget(
    this.src, {
    this.width = 100,
    double height,
    this.fit = BoxFit.cover,
  }) : iHeight = height ?? width;

  final String src;
  final double width;
  final double iHeight;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(iHeight),
      fit: fit,
      frameBuilder: (
        BuildContext context,
        Widget child,
        int frame,
        bool wasSynchronouslyLoaded,
      ) {
        if (frame == null) {
          // 占位图片
          return Image.asset(
            "assets/images/placeholder_image.png",
            width: ScreenUtil().setWidth(width),
            height: ScreenUtil().setWidth(iHeight),
            fit: BoxFit.cover,
          );
        }
        return child;
      },
    );
  }
}
