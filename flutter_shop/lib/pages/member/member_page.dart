/**
 * @ClassName member_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-01 19:26
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("会员中心"),
      ),
      body: ListView(
        children: <Widget>[
          _topHeader(),
        ],
      ),
    );
  }

  // 顶部头像
  Widget _topHeader() {
    return Container(
      width: ScreenUtil().setWidth(750),
    );
  }
}
