import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpTestRoute extends StatefulWidget {
  @override
  _HttpTestRouteState createState() => _HttpTestRouteState();
}

class _HttpTestRouteState extends State<HttpTestRoute> {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("获取百度首页"),
                  onPressed: _loading ? null : _getBaiDuIndexData(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(_text.replaceAll(RegExp(r"\s"), "")),
                ),
              ],
            ),
          ),
        ));
  }

  // 点击获取按钮
  // 被async修饰的方法将返回一个Future对象
  _getBaiDuIndexData() async {
    setState(() {
      _loading = true;
      _text = "正在请求...";
    });

    try {
      // 1. 创建httpClient
      HttpClient httpClient = HttpClient();
      httpClient.connectionTimeout = Duration(seconds: 60); // 设置连接超时时间
      // 2. 打开http链接
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
      //使用iPhone的UA
      request.headers.add("user-agent",
          "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
      // 3. 等待连接服务器（会将请求信息发送给服务器）
      HttpClientResponse response = await request.close();
      // 4. 读取响应内容
      _text = await response.transform(utf8.decoder).join();
      print(response.headers);
      // 5. 关闭client后，通过该client发起的所有请求都会中止。
      httpClient.close();
    } catch (e) {
      _text = "请求失败:$e";
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
