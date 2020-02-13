/**
 * @ClassName detail_explain
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-13 17:54
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailExplain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.white,
      child: Text(
        "说明：> 急速送达 > 正品保证",
        style: TextStyle(
          color: Colors.red,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }
}
