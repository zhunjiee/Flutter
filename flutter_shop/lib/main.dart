import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'pages/index_page.dart';
import 'provider/category_provider.dart';
import 'provider/category_goods_list_provider.dart';
import 'provider/goods_detail_provider.dart';
import 'provider/cart_provider.dart';
import 'provider/current_index_provider.dart';
import 'routers/application.dart';
import 'routers/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>.value(value: CategoryProvider()),
        ChangeNotifierProvider<CategoryGoodsListProvider>.value(value: CategoryGoodsListProvider()),
        ChangeNotifierProvider<GoodsDetailProvider>.value(value: GoodsDetailProvider()),
        ChangeNotifierProvider<CartProvider>.value(value: CartProvider()),
        ChangeNotifierProvider<CurrentIndexProvider>.value(value: CurrentIndexProvider()),
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
        home: IndexPageWithProvider(),
        debugShowCheckedModeBanner: false, // 去除debug字样

        // 添加国际化支持
        localizationsDelegates: [
          GlobalEasyRefreshLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('zh', 'CN'),
          Locale('en', 'US'),
        ],
//        locale: Locale('zh', 'CN'),
      ),
    );
  }
}
