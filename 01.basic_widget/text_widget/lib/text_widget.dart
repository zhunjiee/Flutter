import 'package:flutter/material.dart';

class TextWidgetTest extends StatefulWidget {
  @override
  _TextWidgetTestState createState() => _TextWidgetTestState();
}

class _TextWidgetTestState extends State<TextWidgetTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Hello，大家好！我是水水。马上就到年底了，各位小伙伴有多少打算换电脑呢？很多人应该都记得微软在10月份的那场发布会，一口气发布了6款新设备，这其中不乏关注度爆棚的双屏移动设备Surface Duo，还有可能成为新形态电脑的Surface Neo。但水水最在意的，却是已经推出到第三代的Surface Laptop 3。",
            textAlign: TextAlign.left,  // 对齐方式
            maxLines: 3,  // 最大行数
            overflow: TextOverflow.ellipsis,  // 文本溢出,ellipsis显示省略号
            style: TextStyle(
              height: 2,  // 该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于 fontSize * height。
              color: Color.fromARGB(255, 51, 5, 126),
              fontSize: 12,
              backgroundColor: Colors.green[100],
              decoration: TextDecoration.lineThrough, // 装饰物
              decorationColor: Colors.redAccent,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
        ),

        // TextSpan
        Text.rich(TextSpan(
          children: [
            TextSpan(
              text: "Home:",
            ),
            TextSpan(
              text: "https://www.baidu.com",
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline
              )
            )
          ]
        )),
      ],
    );
  }
}
