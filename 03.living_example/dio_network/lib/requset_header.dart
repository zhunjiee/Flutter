/**
 * @ClassName requset_header
 * @Description 设置请求头
 * @Author HouGe
 * @Date 2020-02-03 12:44
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'config/http_header.dart';

class RequestHeaderDemo extends StatefulWidget {
  @override
  _RequestHeaderDemoState createState() => _RequestHeaderDemoState();
}

class _RequestHeaderDemoState extends State<RequestHeaderDemo> {
  String showText = "还没有请求数据";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("伪造请求头"),
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
    print("开始请求数据");
    loadServerData().then((value) {
      setState(() {
        showText = value["data"].toString();
      });
    });
  }

  Future loadServerData() async {
    try {
      Dio dio = Dio();
      // 设置请求头
      dio.options.headers = httpHeader;
      Response response;
      response = await dio.post(
          "https://time.geekbang.org/serv/v1/column/newAll");
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
