/**
 * @ClassName splash_page
 * @Description 启动页
 * @Author HouGe
 * @Date 2020-02-22 13:05
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  AnimationController _logoController;
  CurvedAnimation _logoAnimation;

  @override
  void initState() {
    super.initState();
    _logoController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Future.delayed(Duration(milliseconds: 500), (){
      // 启动动画
      _logoController.forward();
    });
    // 使用弹性曲线
    _logoAnimation = CurvedAnimation(parent: _logoController, curve: Curves.easeOutQuart);
    // 监听动画状态的改变
    _logoController.addStatusListener((status){
      // 动画完成后页面跳转
      if (status == AnimationStatus.completed) {
          Future.delayed(Duration(milliseconds: 500), (){
            goPage();
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ScaleTransition( // 动画缩放
          scale: _logoAnimation,
          child: Hero(
              tag: "logo",
              child: Image.asset("images/icon_logo.png"),
          ),),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _logoController.dispose();
  }

  // 跳转到新页面
  void goPage() {
    print("跳转到新页面");
  }
}
