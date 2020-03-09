/**
 * @ClassName play_music_gramophone
 * @Description 音乐播放界面 - 唱片机视图
 * @Author houge
 * @Date 2020/3/9 3:08 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/widget_circular_image.dart';

class PlayMusicGramophone extends StatefulWidget {
  PlayMusicGramophone(this.play);

  final bool play;

  @override
  _PlayMusicGramophoneState createState() => _PlayMusicGramophoneState();
}

class _PlayMusicGramophoneState extends State<PlayMusicGramophone>
    with TickerProviderStateMixin {
  AnimationController _recordController; // 碟片旋转动画
  AnimationController _stylusController; // 唱针控制器
  Animation _stylusAnimation; // 唱针动画

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
    if (widget.play) {

    }

    _stylusController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _stylusAnimation =
        Tween(begin: -0.03, end: -0.10).animate(_stylusController);

  }

  @override
  Widget build(BuildContext context) {
    if (widget.play) {
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
          _recordController.stop();
          _stylusController.forward();
        },
        child: Stack(
          children: <Widget>[
            // 唱片
            _recordWidget(),
            // 唱针
            _stylusWidget(),
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
                "http://p1.music.126.net/HdSDvsZbngXLgehNmBfjmg==/109951163897119665.jpg?param=200y200",
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
