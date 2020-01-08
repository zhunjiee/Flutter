import 'package:flutter/material.dart';

class ArgumentsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取路由参数
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由参数传递"),
      ),
      body: Center(
        child: Text(args),
      ),
    );
  }
}
