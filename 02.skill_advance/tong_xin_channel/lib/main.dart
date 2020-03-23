import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  static final String METHOD_CHANNEL = "com.zhunjiee.flutter/android";
  static final String NATIVE_METHOD_ADD = "numberAdd";
  static final String EVENT_CHANNEL = "com.zhunjiee.flutter/android/event";
  static final String NATIVE_SEND_MESSAGE_TO_FLUTTER = "nativeSendMessage2Flutter"; //原生主动向flutter发送消息

  static final MethodChannel _methodChannel = MethodChannel(METHOD_CHANNEL);
  static final EventChannel _eventChannel = EventChannel(EVENT_CHANNEL);

  String _fromNativeInfo = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object object) {
    print(object.toString() + "-------------从原生主动传递过来的值");
    setState(() {
      _fromNativeInfo = object.toString();
    });
  }

  void _onError(Object object) {
    print(object.toString() + "-------------从原生主动传递过来的值");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter与原生交互"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("从原生平台主动传递回来的值"),
            Text(_fromNativeInfo),
            RaisedButton(
              onPressed: () {
                _methodChannel.invokeMethod(NATIVE_SEND_MESSAGE_TO_FLUTTER);
              },
              child: Text("EventChannel - Navite端主动向Flutter端发送消息"),
            ),
            RaisedButton(
              onPressed: () {
                getNumberResult(12, 13);
              },
              child: Text("MethodChannel - 调用原生计算两个数的和"),
            ),
          ],
        ),
      ),
    );
  }

  void getNumberResult(int a, int b) async {
    Map<String, int> map = {"num1" : a, "num2" : b};
    int result = await _methodChannel.invokeMethod(NATIVE_METHOD_ADD, map);
    print("调用原生平台计算后的结果为: $result");
  }
}
