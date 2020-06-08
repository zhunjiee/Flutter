import 'dart:async';

/**
 * @ClassName splash_page
 * @Description 广告页
 * @Author Houge
 * @Date 2020/6/8 8:48 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage(this.seconds, {this.onTimeFinish});

  final int seconds;
  final Function onTimeFinish;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _countDownNum = 0;
  Timer _countDownTimer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _countDownNum = widget.seconds;
    _startCountDownTimer();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.redAccent,
      child: Center(
        child: Text(
          "倒计时$_countDownNum",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }

  /// 倒计时
  void _startCountDownTimer() {
    // 循环的
    _countDownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDownNum == 0) {
          // 停止倒计时
          _countDownTimer.cancel();
          widget.onTimeFinish();
        } else {
          _countDownNum -= 1;
        }
      });
    });
  }

  @override
  void dispose() {
    // 清除定时器
    _countDownTimer.cancel();
    _countDownTimer = null;
    super.dispose();
  }
}
