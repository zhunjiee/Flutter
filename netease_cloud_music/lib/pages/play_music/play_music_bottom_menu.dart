/**
 * @ClassName play_music_bottom_menu
 * @Description TODO
 * @Author houge
 * @Date 2020/3/9 1:18 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/widget_img_menu.dart';

class PlayMusicBottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: ScreenUtil().setWidth(150),
      child: Row(
        children: <Widget>[
          ImageMenuWidget(
            "images/icon_song_play_type_1.png",
            size: 80,
          ),
          ImageMenuWidget(
            "images/icon_song_left.png",
            size: 80,
          ),
          ImageMenuWidget(
            "images/icon_song_pause.png",
            size: 150,
            onTap: () {
              print("播放");
            },
          ),
          ImageMenuWidget(
            "images/icon_song_right.png",
            size: 80,
          ),
          ImageMenuWidget(
            "images/icon_play_songs.png",
            size: 80,
          ),
        ],
      ),
    );
  }
}
