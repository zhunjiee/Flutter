import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'routers/routes.dart';
import 'application.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // fluro路由全局注入
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;

    return FlutterEasyLoading(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          platform: TargetPlatform.iOS, // 向右滑返回前一页, 导航栏标题居中
        ),
        onGenerateRoute: Application.router.generator, // 生成路由
        debugShowCheckedModeBanner: false, // 去除debug字样
        home: SplashPage(3, onTimeFinish: () {
          print("倒计时完成");
        }),
      ),
    );
  }
}
