/**
 * @ClassName mine
 * @Description 顶部轮播图
 * @Author HouGe
 * @Date 2020-02-25 21:01
 * @Version 1.0
 */

import 'package:flutter/material.dart';
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin{
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    print("我的");
    return Container(
      child: Center(
        child: Text("我的"),
      ),
    );
  }
}
