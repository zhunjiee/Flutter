import 'package:flutter/material.dart';
import 'launch_screen.dart';
import 'second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 右滑返回前一页功能
        platform: TargetPlatform.iOS,
        primarySwatch: Colors.blue,
      ),
      home: LaunchScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launch Screen Demo"),
      ),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SecondPage();
              },
            ),
          );
        },
        child: Text("跳转到下一页"),
      )),
    );
  }
}
