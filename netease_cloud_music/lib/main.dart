import 'package:flutter/material.dart';
import 'widgets/widget_loading.dart';
import 'pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netease Cloud Music',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
