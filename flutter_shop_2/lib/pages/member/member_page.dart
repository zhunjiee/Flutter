/**
 * @ClassName memeber_page
 * @Description TODO
 * @Author Houge
 * @Date 2020/6/12 8:58 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人中心"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "个人中心",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
