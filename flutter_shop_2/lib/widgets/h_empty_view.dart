/// @ClassName h_empty_view
/// @Description 水平空白占位视图
/// @Author HouGe
/// @Date 2020/7/30 1:52 PM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalEmptyView extends StatelessWidget {
  HorizontalEmptyView({this.width = 10});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(width),
    );
  }
}
