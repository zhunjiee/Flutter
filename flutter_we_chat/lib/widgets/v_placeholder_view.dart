/**
 * @ClassName widget_empty_view
 * @Description 垂直方向占位视图
 * @Author HouGe
 * @Date 2020-02-21 21:26
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalPlaceholderView extends StatelessWidget {
  VerticalPlaceholderView(this.height);

  final double height;

  @override
  Widget build(BuildContext context) {
    double h = height == null ? 10 : height;
    return Container(
      height: ScreenUtil().setWidth(h),
    );
  }
}
