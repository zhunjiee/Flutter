/**
 * @ClassName app_page
 * @Description 应用
 * @Author houge
 * @Date 2020/4/7 8:25 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("应用"),
      ),
    );
  }
}
