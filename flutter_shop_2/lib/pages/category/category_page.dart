/**
 * @ClassName category
 * @Description TODO
 * @Author Houge
 * @Date 2020/6/12 8:57 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分类"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "分类",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
