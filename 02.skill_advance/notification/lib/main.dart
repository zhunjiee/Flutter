import 'package:flutter/material.dart';
import 'my_notification.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        print("接收到下面发来的通知: ${notification.msg}");
        setState(() {
          _msg = notification.msg;
        });
        return true; // 阻止冒泡,父NotificationListener不会接收到通知
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter 中的 Notification"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_msg),
              Builder(builder: (context){
                return RaisedButton(
                  onPressed: () {
                    MyNotification("Flutter中的Notification只能用于子组件向父widget发送通知").dispatch(context);
                  },
                  child: Text('发送通知'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
