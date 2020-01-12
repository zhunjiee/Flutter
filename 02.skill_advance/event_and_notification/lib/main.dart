import 'package:flutter/material.dart';
import 'gesture_detector_test.dart';
import 'drag_test.dart';
import 'scale_test.dart';
import 'notification_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "getture_detector" : (context) => GestureDetectorTestRoute(),
        "drag_test" : (context) => DragTestRoute(),
        "scale_test" : (context) => ScaleTestRoute(),
        "notification_test" : (context) => NotificationTestRoute(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("原始指针事件处理"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Listener(
              child: Container(
                alignment: Alignment.center,
                color: Colors.redAccent,
                width: 300,
                height: 150,
                child: Text(
                  _event?.toString() ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPointerDown: (PointerDownEvent event) {
                setState(() {
                  _event = event;
                });
              },
              onPointerMove: (event) {
                setState(() {
                  _event = event;
                });
              },
              onPointerUp: (event) {
                setState(() {
                  _event = event;
                });
              },
            ),
            Stack(
              children: <Widget>[
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.blue)),
                  ),
                  onPointerDown: (event) => print("down0"),
                ),
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                    child: Center(
                      child: Text("左上角200*100范围内非文本区域点击"),
                    ),
                  ),
                  onPointerDown: (event) => print("down1"),
                  behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
                ),
              ],
            ),
            RaisedButton(
              child: Text("GestureDetector"),
              onPressed: (){
                Navigator.of(context).pushNamed("getture_detector");
              },
            ),
            RaisedButton(
              child: Text("DragTest"),
              onPressed: (){
                Navigator.of(context).pushNamed("drag_test");
              },
            ),
            RaisedButton(
              child: Text("ScaleTest"),
              onPressed: (){
                Navigator.of(context).pushNamed("scale_test");
              },
            ),
            RaisedButton(
              child: Text("NotificationTest"),
              onPressed: (){
                Navigator.of(context).pushNamed("notification_test");
              },
            ),
          ],
        ),
      ),
    );
  }
}
