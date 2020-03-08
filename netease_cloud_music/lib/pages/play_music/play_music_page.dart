import 'dart:ui';

/**
 * @ClassName play_songs_page
 * @Description 音乐播放界面
 * @Author houge
 * @Date 2020/3/8 11:00 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../utils/common_text_style.dart';
import '../../utils/utils.dart';
import '../../application.dart';

class PlayMusicPage extends StatefulWidget {
  @override
  _PlayMusicPageState createState() => _PlayMusicPageState();
}

class _PlayMusicPageState extends State<PlayMusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
//          Utils.showNetImage(
//            "url",
//            width: double.infinity,
//            height: double.infinity,
//            fit: BoxFit.fitHeight,
//          ),
          Image.asset("images/welcome.png"),
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
                  "雅俗共赏",
                  style: mWhiteBoldTextStyle,
                ),
                Text(
                  "许嵩",
                  style: smallWhite70TextStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: kToolbarHeight + Application.statusBarHeight),
            color: Colors.red,
            child: ,
          ),
        ],
      ),
    );
  }
}
