/**
 * @ClassName count_down_button
 * @Description TODO
 * @Author houge
 * @Date 2020/3/10 1:54 PM
 * @Version 1.0
 */

import 'dart:async';
import 'package:flutter/material.dart';

class CountDownButton extends StatefulWidget {
  CountDownButton(this.seconds, {this.onTimeFinish});

  final int seconds;
  final Function onTimeFinish;

  @override
  _CountDownButtonState createState() => _CountDownButtonState();
}

class _CountDownButtonState extends State<CountDownButton> {
  Timer _timer; // 计时器
  int _countDownTime = 0; // 倒计时数字

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_countDownTime == 0) {
          setState(() {
            _countDownTime = widget.seconds;
          });
        }
        // 开始倒计时
        _startCountDownTimer();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 90,
          height: 50,
          alignment: Alignment.center,
          color: _countDownTime > 0
              ? Colors.grey
              : Color.fromARGB(255, 17, 132, 255),
          child: Text(
            _countDownTime > 0 ? "${_countDownTime}s后获取" : "获取验证码",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  /// 倒计时
  void _startCountDownTimer() {
    // 只能倒计时
    _timer = Timer(Duration(seconds: 10), (){
      print("10秒时间到了");
    });

    // 循环的
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDownTime < 1) {
          // 停止倒计时
          _timer.cancel();
          widget.onTimeFinish();
        } else {
          _countDownTime -= 1;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
