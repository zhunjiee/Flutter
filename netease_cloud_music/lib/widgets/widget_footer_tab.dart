/**
 * @ClassName widget_footer_tab
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-03 12:05
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/utils/common_text_style.dart';
import 'package:netease_cloud_music/widgets/v_placeholder_view.dart';

class FooterTabItem extends StatelessWidget {
  FooterTabItem(this.img, this.name, {this.onTap});

  final String img;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap == null ? (){print("没有点击方法");} : onTap,
        child: Column(
          children: <Widget>[
            Image.asset(
              img,
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            VerticalPlaceholderView(8),
            Text(
              name,
              style: common14White70TextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
