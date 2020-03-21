/**
 * @ClassName member_header
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-17 23:41
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setWidth(450),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              "images/header_background_img.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: ScreenUtil().setWidth(80),
                backgroundImage: AssetImage("images/header_img.jpg"),
              ),
              Container(
                width: ScreenUtil().setWidth(750),
                margin: EdgeInsets.only(top: 4),
                child: Text(
                  "侯歌最帅",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(30),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
