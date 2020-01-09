import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPageView extends StatefulWidget {
  @override
  _SecondPageViewState createState() => _SecondPageViewState();
}

class _SecondPageViewState extends State<SecondPageView> {
  // 创建AlertDialog对话框
  Future<bool> showDeleteConfirmDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("提示"),
            content: Text("您确定要删除当前文件吗?"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                // 直接关闭对话框,不返回任何数据
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  //关闭对话框并返回true
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹出对话框演示"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("AlertDialog"),
              onPressed: () async {
                bool result = await showDeleteConfirmDialog();
                if (result == null) {
                  print("已经取消删除");
                } else {
                  print("确认删除");
                  // 进行删除操作
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
