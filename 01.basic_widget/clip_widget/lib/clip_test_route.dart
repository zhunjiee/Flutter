import 'package:flutter/material.dart';

class ClipTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.asset(
      "images/avatar.jpg",
      width: 60,
    );

    return Center(
      child: Column(
        children: <Widget>[
          avatar, // 不剪裁图片
          ClipOval(
            // 剪裁为圆形
            child: avatar,
          ),
          ClipRRect(
            // 剪裁为圆角矩形
            child: avatar,
            borderRadius: BorderRadius.circular(8.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: avatar,
                widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
              ),
              Text(
                "世间美好与你环环相扣",
                style: TextStyle(color: Colors.redAccent),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                // 将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  child: avatar,
                  widthFactor: .5, //宽度设为原来宽度一半
                  heightFactor: .5,
                ),
              ),
              Text(
                "世间美好与你环环相扣",
                style: TextStyle(color: Colors.redAccent),
              ),
            ],
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.orange),
            child: ClipRect(
              clipper: MyClipper(),
              child: avatar,
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10, 15, 40, 30);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
