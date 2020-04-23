/**
 * @ClassName splash_page
 * @Description 广告页
 * @Author Houge
 * @Date 2020/3/31 3:39 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../utils/navigator_util.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 倒计时跳转
    Future.delayed(Duration(milliseconds: 3000), (){
      NavigatorUtil.goHomePage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.redAccent,
      ),
    );
  }

  Widget _buildSplashBackground() {
    return Image.asset("images/splash_bg.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
