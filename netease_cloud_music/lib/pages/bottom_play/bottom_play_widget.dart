/**
 * @ClassName play_widget
 * @Description App底部的播放条
 * @Author HouGe
 * @Date 2020-02-26 11:10
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/utils/common_color.dart';
import '../../widgets/h_placeholder_view.dart';
import '../../application.dart';
import '../../utils/common_text_style.dart';
import '../../utils/common_color.dart';
import '../../widgets/widget_circular_image.dart';

class BottomPlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: ScreenUtil().setHeight(110) + Application.bottomBarHeight,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: separateColor)),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
        child: Container(
          height: ScreenUtil().setHeight(110),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
          alignment: Alignment.center,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: Row(
              children: <Widget>[
                CircularImage(
                  "images/pause.png",
                  80,
                  fit: BoxFit.fill,
                ),
                HorizontalPlaceholderView(10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "月半小夜曲",
                        style: commonTextStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "哈哈哈哈哈",
                        style: common13TextStyle,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "images/play.png",
                    width: ScreenUtil().setWidth(50),
                  ),
                ),
                HorizontalPlaceholderView(15),
                GestureDetector(
                  child: Image.asset(
                    "images/list.png",
                    width: ScreenUtil().setWidth(50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
