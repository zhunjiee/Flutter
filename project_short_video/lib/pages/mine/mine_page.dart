/**
 * @ClassName mine_page
 * @Description 我的
 * @Author houge
 * @Date 2020/4/7 8:25 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("我的"),
      ),
    );
  }
}
