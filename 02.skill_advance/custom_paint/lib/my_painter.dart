/**
 * @ClassName my_painter
 * @Description TODO
 * @Author houge
 * @Date 2020/3/12 6:39 PM
 * @Version 1.0
 */

import 'dart:math';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    // 画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true // 抗锯齿
      ..style = PaintingStyle.fill // 画笔样式: 填充
      ..color = Color(0x77cdb175); // 棋盘背景黄色
    canvas.drawRect(Offset.zero & size, paint);

    // 画棋盘网格
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i < 16; i++) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }
    for (int i = 0; i < 16; i++) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    // 画黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
        Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);

    // 画白子
    paint.color = Colors.white;
    canvas.drawCircle(
        Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);

    paint.color = Colors.black;
    canvas.drawCircle(
        Offset(size.width / 2 + eWidth / 2, size.height / 2 + eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);
  }

  // 尽可能的利用好shouldRepaint返回值；
  // 在UI树重新build时，控件在绘制前都会先调用该方法以确定是否有必要重绘；
  // 假如我们绘制的UI不依赖外部状态，那么就应该始终返回false，
  // 因为外部状态改变导致重新build时不会影响我们的UI外观；
  // 如果绘制依赖外部状态，那么我们就应该在shouldRepaint中判断依赖的状态是否改变，
  // 如果已改变则应返回true来重绘，反之则应返回false不需要重绘。

  // 绘制尽可能多的分层；
  // 在上面五子棋的示例中，我们将棋盘和棋子的绘制放在了一起，这样会有一个问题：
  // 由于棋盘始终是不变的，用户每次落子时变的只是棋子，但是如果按照上面的代码来实现，
  // 每次绘制棋子时都要重新绘制一次棋盘，这是没必要的。
  // 优化的方法就是将棋盘单独抽为一个组件，并设置其shouldRepaint回调值为false，
  // 然后将棋盘组件作为背景。然后将棋子的绘制放到另一个组件中，这样每次落子时只需要绘制棋子。
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
