/**
 * @ClassName home_page
 * @Description TODO
 * @Author Houge
 * @Date 2020/6/12 8:56 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("百姓生活+"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "首页",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
