/**
 * @ClassName home_page
 * @Description 首页
 * @Author houge
 * @Date 2020/4/7 8:25 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("首页"),
      ),
    );
  }
}
