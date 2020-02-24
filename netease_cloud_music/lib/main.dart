import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import 'utils/log_utils.dart';
import 'application.dart';
import 'routes/routes.dart';
import 'routes/navigate_service.dart';
import 'pages/splash_page.dart';
import 'provider/user_provider.dart';

void main() {
  // fluro全局注入
  final router = Router();
  Routes.configRoutes(router);
  Application.router = router;
  // ServiceLocator注入
  Application.setupLocator();
  // log初始化
  LogUtils.init(tag: "NETEASE_MUSIC");

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>.value(value: UserProvider()),
        ],
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netease Cloud Music',
      theme: ThemeData(
        primarySwatch: Colors.red,
        platform: TargetPlatform.iOS,
      ),
      debugShowCheckedModeBanner: false,  // 不显示debug字样
      onGenerateRoute: Application.router.generator,  // 生成路由
      navigatorKey: Application.getIt<NavigateService>().key, // 导航键,用于无context实现跳转
      home: SplashPage(),
    );
  }
}