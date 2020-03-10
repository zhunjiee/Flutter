import 'package:flutter/material.dart';
import 'count_down_button.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("倒计时"),
      ),
      body: Container(
        child: Center(
          child: CountDownButton(
          10,
          onTimeFinish: (){
            print("倒计时完成");
          },),
        ),
      ),
    );
  }
}
