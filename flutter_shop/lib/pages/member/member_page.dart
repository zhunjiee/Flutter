/**
 * @ClassName member_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-01 19:26
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'member_header.dart';
import 'member_order.dart';
import 'member_list.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("会员中心"),
      ),
      body: ListView(
        children: <Widget>[
          MemberHeader(),
          MemberOrder(),
          MemberList(),
        ],
      ),
    );
  }


}
