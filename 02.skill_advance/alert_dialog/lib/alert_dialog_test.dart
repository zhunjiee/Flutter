import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPageView extends StatefulWidget {
  @override
  _SecondPageViewState createState() => _SecondPageViewState();
}

class _SecondPageViewState extends State<SecondPageView> {
  // AlertDialog
  Future<bool> showDeleteConfirmDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
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

  // SimpleDialog
  changeLanguage() async {
    int i = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("请选择语言"),
            children: <Widget>[
              SimpleDialogOption(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: const Text("中文简体"),
                ),
                onPressed: () => Navigator.of(context).pop(1),
              ),
              SimpleDialogOption(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: const Text("美国英语"),
                ),
                onPressed: () => Navigator.of(context).pop(2),
              ),
              SimpleDialogOption(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: const Text("俄语"),
                ),
                onPressed: () => Navigator.of(context).pop(3),
              ),
              SimpleDialogOption(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: const Text("西班牙语"),
                ),
                onPressed: () => Navigator.of(context).pop(4),
              )
            ],
          );
        });

    _dealChangeLanguage(i);
  }

  // 处理选择结果
  void _dealChangeLanguage(int i) {
    String language = "";
    if (i != null) {
      switch (i) {
        case 1:
          language = "中文简体";
          break;

        case 2:
          language = "美国英语";
          break;

        case 3:
          language = "俄语";
          break;

        case 4:
          language = "西班牙语";
          break;
      }

      print("选择了:$language");
    }
  }

  // Dialog
  Future<void> showListDialog() async {
    int index = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          var child = Column(
            children: <Widget>[
              Container(
                color: Colors.blue[100],
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("请选择")
                    ],
                  )
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () {
                        Navigator.of(context).pop(index);
                      },
                    );
                  },
                  itemCount: 20,
                  itemExtent: 50.0,
                ),
              )
            ],
          );

          return Dialog(child: child);
        });

    if (index != null) {
      print("点击了:$index");
    }
  }

  // loading
  showLoadingDialog() {
    showDialog(context: context, builder: (BuildContext context){
      return UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: SizedBox(
          width: 280,
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text("正在加载中,请稍后..."),
                )
              ],
            ),
          ),
        ),
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
            ),
            RaisedButton(
              child: Text("SimpleDialog"),
              onPressed: () async {
                await changeLanguage();
              },
            ),
            RaisedButton(
              child: Text("Dialog"),
              onPressed: () async {
                await showListDialog();
              },
            ),

            RaisedButton(
              child: Text("Dialog"),
              onPressed: () {
                showLoadingDialog();
              },
            ),
            RaisedButton(
              child: Text("对话框转台管理"),
              onPressed: () {
                showLoadingDialog();
              },
            ),
          ],
        ),
      ),
    );
  }
}