/**
 * @ClassName index_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-19 21:58
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'discover/discover_page.dart';
import '../utils/http_request.dart';
import '../utils/common_url.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 设置高度为0的AppBar,目的是为了设置状态栏颜色
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0, // 隐藏分割线
          ),
          preferredSize: Size.zero),
      body: SafeArea(
        bottom: false,
        child: RaisedButton(
          onPressed: () async {

          },
          child: Text("加载"),
        ),
      ),
    );
  }
}
