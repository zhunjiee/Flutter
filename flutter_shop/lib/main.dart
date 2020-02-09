import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'pages/index_page.dart';
import 'package:provider/provider.dart';
import 'provider/category_provider.dart';
import 'provider/category_goods_list_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>.value(value: CategoryProvider()),
        ChangeNotifierProvider<CategoryGoodsListProvider>.value(value: CategoryGoodsListProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "百姓生活+",
        debugShowCheckedModeBanner: false, // 去除debug字样
        theme: ThemeData(
          primaryColor: Colors.pink,
          platform: TargetPlatform.iOS, // 向右滑返回上一页
        ),
        home: IndexPage(),
      ),
    );
  }
}
