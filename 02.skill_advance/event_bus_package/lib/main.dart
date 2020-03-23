import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'event_bus.dart';
import 'common/common_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _primaryColor;
  // 订阅者
  StreamSubscription _colorSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setThemeColor();
    
    /// 添加订阅者
    _colorSubscription = eventBus.on<ThemeColorEvent>().listen((event){
      // 缓存主题颜色
      _getCacheColor(event.colorStr);
      Color color = CommonColor.getColor(event.colorStr);
      setState(() {
        _primaryColor = color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: _primaryColor,
      ),
      home: MyHomePage(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    /// 移除订阅者,防止内存泄漏
    _colorSubscription.cancel();
  }
  
  /// 设置主题色
  void _setThemeColor() async {
    String cacheColorStr = await _getCacheColor("themeColorStr");
    setState(() {
      CommonColor.getColor(cacheColorStr);
    });
  }
  
  /// 取出缓存的主题色
  Future<String> _getCacheColor(String colorKey) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String colorStr = preferences.getString(colorKey);
    return colorStr;
  }
}




class MyHomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBus案例-切换主题色"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "eventbus事件总线输入颜色值修改APP主题色",
                style: TextStyle(fontSize: 14, color: Color(0xff666666)),
              ),
            ),
            TextField(
              controller: _controller,
              style: TextStyle(color: Color(0xFF888888)),
              decoration: InputDecoration(
                hintText: "输入正确的颜色值,如黑色：#000000",
                hintStyle: TextStyle(color: Color(0xFF888888)),
                contentPadding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                if (_controller.text.isEmpty) {
                  print("请输入颜色值");
                  return;
                }
                /// 触发事件，事件触发后该事件所有订阅者会被调用
                /// 发送订阅消息去修改颜色
                eventBus.fire(ThemeColorEvent(_controller.text));
              },
              child: Text(
                '确定',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
