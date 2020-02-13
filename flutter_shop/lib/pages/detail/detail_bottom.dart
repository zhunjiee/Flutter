/**
 * @ClassName detail_bottom
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-13 18:25
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(100),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(110),
            height: ScreenUtil().setHeight(100),
            child: RaisedButton(
              onPressed: () {},
              child: Icon(
                Icons.shopping_cart,
                color: Colors.red,
                size: 30,
              ),
              color: Colors.white,
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(320),
            height: ScreenUtil().setHeight(100),
            child: RaisedButton(
              onPressed: () {},
              child: Text(
                "加入购物车",
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(28)),
              ),
              color: Colors.green,
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(320),
            height: ScreenUtil().setHeight(100),
            child: RaisedButton(
              onPressed: () {},
              child: Text(
                "马上购买",
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(28)),
              ),
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
