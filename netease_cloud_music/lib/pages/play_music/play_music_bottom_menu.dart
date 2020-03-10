import 'package:audioplayers/audioplayers.dart';
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
import '../../provider/play_music_provider.dart';

class PlayMusicBottomMenu extends StatelessWidget {
  PlayMusicBottomMenu(this.provider);

  final PlayMusicProvider provider;

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
            provider.playState == AudioPlayerState.PLAYING
                ? "images/icon_song_pause.png"
                : "images/icon_song_play.png",
            size: 150,
            onTap: () {
              provider.togglePlay();
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
