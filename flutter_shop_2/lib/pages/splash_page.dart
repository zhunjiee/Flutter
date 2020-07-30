import 'dart:async';

/**
 * @ClassName splash_page
 * @Description 广告页
 * @Author Houge
 * @Date 2020/6/8 8:48 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../utils/navigation_utils.dart';
import '../utils/net_utils.dart';

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
    _initGlobalConfig();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        child: Center(
          child: Text(
            "倒计时$_countDownNum",
            style: TextStyle(fontSize: 30, color: Colors.white, fontStyle: FontStyle.italic),
          ),
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
          // 附加事件
          widget.onTimeFinish();
          // 跳转到首页
          NavigationUtils.goHomePage(context);
        } else {
          _countDownNum -= 1;
        }
      });
    });
  }

  /// 各种初始化
  void _initGlobalConfig() {
    // 网络请求工具类初始化
    NetUtils();
  }

  @override
  void dispose() {
    // 清除定时器
    _countDownTimer.cancel();
    _countDownTimer = null;
    super.dispose();
  }
}
