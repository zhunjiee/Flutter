import 'package:flutter/material.dart';

class ImageWidgetTest extends StatefulWidget {
  @override
  _ImageWidgetTestState createState() => _ImageWidgetTestState();
}

class _ImageWidgetTestState extends State<ImageWidgetTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // 从asset加载图片
          Image.asset(
            "images/avatar.png",
            width: 50,
          ),
          Image(
            image: AssetImage("images/avatar.png"),
            width: 50,
          ),

          // 从网络加载图片
          Image.network(
            "https://www.baidu.com/img/bd_logo1.png",
            width: 100,
          ),
          Image(
            image: NetworkImage("https://www.baidu.com/img/bd_logo1.png"),
            width: 200,
            height: 100,
            fit: BoxFit.fitHeight,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.accessible,
                color: Colors.green,
              ),
              Icon(
                Icons.error,
                color: Colors.red,
              ),
              Icon(
                Icons.fingerprint,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
