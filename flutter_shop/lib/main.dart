import 'package:flutter/material.dart';
import 'pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "百姓生活+",
        debugShowCheckedModeBanner: false,  // 去除debug字样
        theme: ThemeData(
          primaryColor: Colors.pink,
          platform: TargetPlatform.iOS, // 向右滑返回上一页
        ),
        home: IndexPage(),
      ),
    );
  }
}
