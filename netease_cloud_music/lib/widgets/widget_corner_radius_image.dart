/**
 * @ClassName widget_corner_radius_image
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-27 20:02
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/utils.dart';

class CornerRadiusImage extends StatelessWidget {
  CornerRadiusImage(
    this.src, {
    this.width,
    this.height,
    this.radius,
    this.fit = BoxFit.cover,
  });

  final String src;
  final double width;
  final double height;
  final double radius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(radius)),
      child: src.startsWith("http")
          ? Utils.showNetImage(
              src,
              width: width == null ? null : ScreenUtil().setWidth(width),
              height: height == null ? null : ScreenUtil().setWidth(height),
              fit: fit,
            )
          : Image.asset(
              src,
              width: width == null ? null : ScreenUtil().setWidth(width),
              height: height == null ? null : ScreenUtil().setWidth(height),
              fit: fit,
            ),
    );
  }
}
