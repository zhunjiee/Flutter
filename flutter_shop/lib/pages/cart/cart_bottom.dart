/**
 * @ClassName cart_bottom
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-16 13:38
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/cart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provider/cart_provider.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setWidth(100),
      child: Row(
        children: <Widget>[
          _selectAllBtn(context),
          _allPriceArea(context),
          _payButton(context),
        ],
      ),
    );
  }

  Widget _selectAllBtn(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: Provider.of<CartProvider>(context).allSelected,
            onChanged: (v) {
              Provider.of<CartProvider>(context, listen: false).changeAllGoodsSelectedStatus(v);
            },
            activeColor: Colors.red,
          ),
          Text("全选"),
        ],
      ),
    );
  }

  Widget _allPriceArea(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(400),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomRight,
                width: ScreenUtil().setWidth(240),
                height: ScreenUtil().setWidth(60),
                child: Text(
                  "合计: ",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(34),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                width: ScreenUtil().setWidth(160),
                height: ScreenUtil().setWidth(60),
                child: Text(
                  "¥ ${Provider.of<CartProvider>(context).allPrice}",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(400),
            alignment: Alignment.centerRight,
            child: Text(
              "满10元免配送费，预购免配送费",
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil().setSp(22),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _payButton(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(190),
      height: ScreenUtil().setWidth(90),
      padding: EdgeInsets.only(left: 10, top: 5),
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          "结算(${Provider.of<CartProvider>(context).allCount})",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.pink,
      ),
    );
  }
}
