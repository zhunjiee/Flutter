/**
 * @ClassName play_music_handle
 * @Description 歌曲操作组件
 * @Author houge
 * @Date 2020/3/9 12:35 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/utils/common_text_style.dart';
import '../../widgets/widget_img_menu.dart';

class PlayMusicOptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(100),
      child: Row(
        children: <Widget>[
          ImageMenuWidget(
            "images/icon_dislike.png",
            size: 80,
            onTap: () {
              print("喜欢");
            },
          ),
          ImageMenuWidget(
            "images/icon_song_download.png",
            size: 80,
          ),
          ImageMenuWidget(
            "images/bfc.png",
            size: 80,
          ),
          _commentMenu(),
          ImageMenuWidget(
            "images/icon_song_more.png",
            size: 80,
          ),
        ],
      ),
    );
  }

  /// 评论按钮
  Widget _commentMenu() {
    return Expanded(
      // Align解决不对齐的问题
      child: Align(
        child: Container(
          width: ScreenUtil().setWidth(130),
          height: ScreenUtil().setWidth(80),
          child: GestureDetector(
            onTap: () {
              print("评论");
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  "images/icon_song_comment.png",
                  width: ScreenUtil().setWidth(80),
                  height: ScreenUtil().setWidth(80),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
//                    color: Colors.red,
                    padding: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
                    width: ScreenUtil().setWidth(58),
                    child: Text(
                      "10w+",
                      style: common10White70TextStyle,
                    ),
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
