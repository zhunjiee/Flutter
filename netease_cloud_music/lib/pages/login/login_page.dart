/**
 * @ClassName login_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-22 18:33
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_animated_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    Future.delayed(Duration(milliseconds: 500), (){
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // 不显示分割线
        brightness: Brightness.light,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(80),
              top: ScreenUtil().setWidth(30),
              right: ScreenUtil().setWidth(80),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Image.asset(
                    "images/icon_logo.png",
                    width: ScreenUtil().setWidth(90),
                    height: ScreenUtil().setHeight(90),
                  ),
                ),
                LoginAnimatedWidget(animation: _animation),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
