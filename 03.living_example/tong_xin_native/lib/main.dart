import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final String METHOD_CHANNEL = "com.zhunjiee.flutter/android";
  static final String METHOD_CHANNEL_ADD = "numberAdd";
  static final MethodChannel _methodChannel = MethodChannel(METHOD_CHANNEL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter与原生平台交互"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text("点击调用原生主动向Flutter发送消息方法"),
            ),
            Container(height: 30,),
            RaisedButton(
              onPressed: () {

              },
              child: Text("计算两个数的和"),
            ),
          ],
        ),
      ),
    );
  }
}
