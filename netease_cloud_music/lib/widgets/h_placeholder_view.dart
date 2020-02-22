/**
 * @ClassName h_placeholder_view
 * @Description 水平方向占位视图
 * @Author HouGe
 * @Date 2020-02-22 12:17
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class HorizontalPlaceholderView extends StatelessWidget {
  HorizontalPlaceholderView({this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null ? 10: width,
    );
  }
}
