/**
 * @ClassName daily_songs_navigator
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-05 13:58
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import '../playlist/playlist_app_bar.dart';

class DailySongsNavigator extends StatelessWidget {
  DailySongsNavigator(this.count);

  final int count;

  @override
  Widget build(BuildContext context) {
    return PlaylistAppBar(
      expandedHeight: ScreenUtil().setHeight(340),
      title: "每日推荐",
      backgroundImg: "images/bg_daily.png",
      count: count,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
            margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(5)),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                    "${DateUtil.formatDate(DateTime.now(), format: "dd")}",
                    style: TextStyle(fontSize: 30),
                  ),
                  TextSpan(
                    text:
                    "/ ${DateUtil.formatDate(DateTime.now(), format: "MM")}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
            margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
            child: Text(
              '根据你的音乐口味，为你推荐好音乐。',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
