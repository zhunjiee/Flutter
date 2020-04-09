import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:projectshortvideo/application.dart';
import 'package:projectshortvideo/routes/routes.dart';
import 'pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // fluro路由全局注入
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}
