import 'package:dio/dio.dart';
/**
 * @ClassName dio_post_demo
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-03 11:09
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class DioPostDemo extends StatefulWidget {
  @override
  _DioPostDemoState createState() => _DioPostDemoState();
}

class _DioPostDemoState extends State<DioPostDemo> {
  String showText = "还没有请求数据";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dio 的 POST 请求"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: _postBtnOnPressed,
                child: Text("请求数据"),
              ),
              Text(
                showText,
                softWrap: true, // 自动换行
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _postBtnOnPressed() {
    loadServerData("hahaha").then((value) {
      setState(() {
        showText = value["data"]["name"].toString() * 4;
      });
    });
  }

  Future loadServerData(String typeText) async {
    try {
      Response response;
      var data = {"name": typeText};
      response = await Dio().post(
          "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/post_dabaojian",
          queryParameters: data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
