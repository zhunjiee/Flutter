/// @ClassName v_empty_view
/// @Description 垂直空白占位视图
/// @Author HouGe
/// @Date 2020/7/30 1:52 PM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalEmptyView extends StatelessWidget {
  VerticalEmptyView({this.height = 10, this.color});

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: ScreenUtil().setWidth(height),
    );
  }
}
