/**
 * @ClassName widget_common_title
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-28 19:32
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/common_text_style.dart';

class CommonTitleWidget extends StatelessWidget {
  CommonTitleWidget(
    this.title, {
    this.top = 10,
    this.bottom = 10,
  });

  final String title;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(30),
          top: ScreenUtil().setWidth(top),
          right: ScreenUtil().setWidth(30),
          bottom: ScreenUtil().setWidth(bottom),
      ),
      child: Text(title, style: mBlackBoldTextStyle),
    );
  }
}
