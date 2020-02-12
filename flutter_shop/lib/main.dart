import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:provider/provider.dart';
import 'provider/category_provider.dart';
import 'provider/category_goods_list_provider.dart';
import 'provider/goods_detail_provider.dart';
import 'package:fluro/fluro.dart';
import 'routers/application.dart';
import 'routers/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>.value(value: CategoryProvider()),
        ChangeNotifierProvider<CategoryGoodsListProvider>.value(value: CategoryGoodsListProvider()),
        ChangeNotifierProvider<GoodsDetailProvider>.value(value: GoodsDetailProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // fluro全局注入
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: "百姓生活+",
        onGenerateRoute: Application.router.generator,
        theme: ThemeData(
          primaryColor: Colors.pink,
          platform: TargetPlatform.iOS, // 向右滑返回上一页
        ),
        home: IndexPage(),
        debugShowCheckedModeBanner: false, // 去除debug字样
      ),
    );
  }
}
