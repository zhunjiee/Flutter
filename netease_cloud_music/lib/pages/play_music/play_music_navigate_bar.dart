/**
 * @ClassName play_music_navigate_bar
 * @Description TODO
 * @Author houge
 * @Date 2020/3/9 10:24 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'dart:ui';
import '../../utils/common_text_style.dart';
import '../../utils/utils.dart';

class PlayMusicNavigateBar extends StatelessWidget {
  PlayMusicNavigateBar(this.musicName, this.artist, this.bgcImgUrl);

  final String musicName;
  final String artist;
  final String bgcImgUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Utils.showNetImage(
            "$bgcImgUrl?param=200y200",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fitHeight,
          ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(
            color: Colors.black38,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        // 透明导航栏, 放在这而不是最上面是为了防遮挡
        AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.white),
          title: Column(
            children: <Widget>[
              Text(
                musicName,
                style: mWhiteBoldTextStyle,
              ),
              Text(
                artist,
                style: smallWhite70TextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
