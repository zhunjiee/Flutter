import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'application.dart';
import 'routes/routes.dart';
import 'pages/index_page.dart';

void main() => runApp(MyApp());

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
        primarySwatch: Colors.green,
      ),
      home: IndexPage(),
    );
  }
}
