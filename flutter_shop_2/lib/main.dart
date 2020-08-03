import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'routers/routes.dart';
import 'application.dart';
import 'pages/splash_page.dart';
import 'utils/net_utils.dart';
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // fluro路由全局注入
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        platform: TargetPlatform.iOS, // 向右滑返回前一页, 导航栏标题居中
      ),
      onGenerateRoute: Application.router.generator, // 生成路由
      debugShowCheckedModeBanner: false, // 去除debug字样
      builder: (BuildContext context, Widget child) {
        return Material(
          child: FlutterEasyLoading(
            child: child,
          ),
        );
      },
      home: SplashPage(3, onTimeFinish: () {
        print("倒计时完成");
      }),
      locale: Locale('zh', 'CH'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('zh', 'CH'), Locale('en', 'US')],
    );
  }
}
