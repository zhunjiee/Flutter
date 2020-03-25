/**
 * @ClassName widget_circular_image
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-27 15:11
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/utils.dart';

class CircularImage extends StatelessWidget {
  CircularImage(
    this.src,
    this.width, {
    this.fit = BoxFit.cover,
  });

  final String src;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    // 可以用 ClipOval 直接剪裁圆形图片, 但是不能设置图片宽高
    // 这里为了设置图片宽高故采用ClipRRect方式剪裁圆形图片
    return ClipRRect(
      borderRadius: BorderRadius.circular(width / 2),
      child: src.startsWith("http")
          ? Utils.showNetImage(
              src,
              width: ScreenUtil().setWidth(width),
              height: ScreenUtil().setWidth(width),
              fit: fit,
            )
          : Image.asset(
              src,
              width: ScreenUtil().setWidth(width),
              height: ScreenUtil().setWidth(width),
              fit: fit,
            ),
    );
  }
}
