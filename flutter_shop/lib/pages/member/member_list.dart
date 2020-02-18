/**
 * @ClassName member_list_tile
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-18 12:19
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class MemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        children: <Widget>[
          _memberListTile("领取优惠券"),
          _memberListTile("已领取优惠券"),
          _memberListTile("地址管理"),
          _memberListTile("客服电话"),
          _memberListTile("关于我们"),
        ],
      ),
    );
  }

  Widget _memberListTile(String title){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12),
        ),
      ),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
}
