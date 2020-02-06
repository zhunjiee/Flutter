/**
 * @ClassName dio_get_demo
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-03 11:07
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioGetDemo extends StatefulWidget {
  @override
  _DioGetDemoState createState() => _DioGetDemoState();
}

class _DioGetDemoState extends State<DioGetDemo> {
  TextEditingController _typeController = TextEditingController();
  FocusNode focusNode = FocusNode();
  String showText = "欢迎你来到美好人间";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美好人间"),
      ),
      // 最外层添加 SingleChildScrollView 解决键盘弹出后报超出边界的警告
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _typeController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  labelText: "美女类型",
                  helperText: "请输入你喜欢的类型",
                ),
                autofocus: true,
                focusNode: focusNode,
              ),
              RaisedButton(
                onPressed: _completeChoose,
                child: Text("选择完毕"),
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  // 点击事件
  void _completeChoose() {
    focusNode.unfocus();
    print("开始选择你喜欢的类型了...");
    print(_typeController.text.toString());

    if (_typeController.text.toString() == "") {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("提示"),
          content: Text(
            "美女类型不能为空",
            style: TextStyle(color: Colors.redAccent),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("确定"),
            ),
          ],
        ),
      );
    } else {
      getHttp(_typeController.text.toString()).then((value) {
        setState(() {
          showText = value["data"]["name"].toString();
        });
      });
    }
  }

  // get请求
  Future getHttp(String type) async {
    try {
      Response response;
      var data = {"name": type};
      response = await Dio().get(
        "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian",
        queryParameters: data,
      );
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
