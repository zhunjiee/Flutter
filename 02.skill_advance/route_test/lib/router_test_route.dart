import 'package:flutter/material.dart';

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("路由返回值"),),
      body: Center(
        child: RaisedButton(
          child: Text("打开提示页"),
          onPressed: () async {
            // 打开`TipRoute`，并等待返回结果
            var result = await Navigator.of(context).pushNamed("tip_route", arguments: "提示信息:哈哈哈哈😁😄😝");
            //输出`TipRoute`路由返回结果
            print("路由返回值: $result");
          },
        ),
      ),
    );
  }
}
