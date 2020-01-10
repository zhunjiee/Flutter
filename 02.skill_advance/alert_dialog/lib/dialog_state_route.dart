import 'package:flutter/material.dart';

class DialogStateRoute extends StatefulWidget {
  @override
  _DialogStateRouteState createState() => _DialogStateRouteState();
}

class _DialogStateRouteState extends State<DialogStateRoute> {
  bool _selectedStatus = false;

  Future<bool> showDeleteConfirmDialog() {
    _selectedStatus = false;
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗?"),
            Row(
              children: <Widget>[
                Text("同时删除子目录?"),
                Checkbox(
                  value: _selectedStatus,
                  onChanged: (v){
                    (context as Element).markNeedsBuild();
                    _selectedStatus = !_selectedStatus;
                  },
                ),
              ],
            )
          ],
        ),
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
              Navigator.of(context).pop(_selectedStatus);
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
        title: Text("对话框状态管理"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("对话框状态管理"),
              onPressed: () async {
                bool delete = await showDeleteConfirmDialog();
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录: $delete");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}