/**
 * @ClassName play_music_gramophone
 * @Description 音乐播放界面 - 唱片机视图
 * @Author houge
 * @Date 2020/3/9 3:08 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provider/play_music_provider.dart';
import '../../widgets/widget_circular_image.dart';
import 'play_music_option.dart';
import 'lyric_page.dart';

class PlayMusicGramophone extends StatefulWidget {
  PlayMusicGramophone(this.provider);

  final PlayMusicProvider provider;

  @override
  _PlayMusicGramophoneState createState() => _PlayMusicGramophoneState();
}

class _PlayMusicGramophoneState extends State<PlayMusicGramophone>
    with TickerProviderStateMixin {
  AnimationController _recordController; // 碟片旋转动画
  AnimationController _stylusController; // 唱针控制器
  Animation _stylusAnimation; // 唱针动画
  int switchIndex = 0;

  @override
  void initState() {
    super.initState();
    _recordController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _recordController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 转完一圈后继续
        _recordController.reset(); // 复位
        _recordController.forward(); // 重新开始
      }
    });

    _stylusController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _stylusAnimation =
        Tween(begin: -0.03, end: -0.10).animate(_stylusController);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.provider.playState == AudioPlayerState.PLAYING) {
      _recordController.forward();  // 碟片转动
      _stylusController.reverse();  // 唱针反向在唱片上
    } else {
      _recordController.stop(); // 唱片停止
      _stylusController.forward();  // 移除状态
    }

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 切换到歌词
          setState(() {
            switchIndex = switchIndex == 0 ? 1 : 0;
          });
        },
        child: IndexedStack(
          index: switchIndex,
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    // 唱片
                    _recordWidget(),
                    // 唱针
                    _stylusWidget(),
                  ],
                ),
                // 歌曲相关操作
                PlayMusicOptionWidget(),
              ],
            ),
            LyricPage(),
          ],
        ),
      ),
    );
  }

  /// 唱片
  Widget _recordWidget() {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(150)),
      child: RotationTransition(
        turns: _recordController, // 动画控制器
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // 黑边
            Image.asset(
              "images/bet.png",
              width: ScreenUtil().setWidth(550),
            ),
            // 专辑图片
            CircularImage(
                "${widget.provider.song.picUrl}?param=200y200",
                370),
          ],
        ),
      ),
    );
  }

  /// 唱针
  Widget _stylusWidget() {
    return Container(
      // 将子组件(唱针)顶部居中
      alignment: Alignment(0.25, -1),
      child: RotationTransition(
        turns: _stylusAnimation,
        child: Image.asset(
          "images/bgm.png",
          width: ScreenUtil().setWidth(205),
          height: ScreenUtil().setWidth(352.8),
        ),
        // 计算旋转支点
        alignment: Alignment(
          -1 + (ScreenUtil().setWidth(45 * 2) / (ScreenUtil().setWidth(293))),
          -1 + (ScreenUtil().setWidth(45 * 2) / (ScreenUtil().setWidth(504))),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _recordController.dispose();
    _stylusController.dispose();
  }
}
