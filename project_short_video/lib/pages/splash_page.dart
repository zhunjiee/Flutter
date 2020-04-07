/**
 * @ClassName splash_page
 * @Description 广告页
 * @Author Houge
 * @Date 2020/3/31 3:39 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
      ),
    );
  }
}
