import 'dart:ui';

/**
 * @ClassName widget_tag
 * @Description TODO
 * @Author houge
 * @Date 2020/3/8 4:54 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/common_text_style.dart';

class TagWidget extends StatelessWidget {
  TagWidget(this.tag);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
        child: Container(
          height: ScreenUtil().setWidth(40),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              alignment: Alignment.center,
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
              color: Colors.white10,
              child: Text(tag, style: smallWhiteTextStyle),
            ),
          ),
        ),
      ),
    );
  }
}
