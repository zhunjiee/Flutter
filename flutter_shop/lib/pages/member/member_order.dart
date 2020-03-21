/**
 * @ClassName Member_order
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-17 23:43
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _orderTitle(),
          _orderType(),
        ],
      ),
    );
  }

  Widget _orderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12),
        ),
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text("我的订单"),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _orderType() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setWidth(150),
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _orderTypeItem(Icons.party_mode, "待付款"),
          _orderTypeItem(Icons.query_builder, "待发货"),
          _orderTypeItem(Icons.directions_car, "待收货"),
          _orderTypeItem(Icons.content_paste, "待评价"),
        ],
      ),
    );
  }

  Widget _orderTypeItem(IconData icon, String text) {
    return Container(
      width: ScreenUtil().setWidth(187),
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 30,
          ),
          Text(text),
        ],
      ),
    );
  }
}
