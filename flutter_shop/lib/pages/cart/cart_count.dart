/**
 * @ClassName cart_count
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-16 21:58
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../model/cart_model.dart';
import '../../provider/cart_provider.dart';

class CartCount extends StatelessWidget {
  CartCount(this.itemModel);

  final CartModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.black12),
      ),
      child: Row(
        children: <Widget>[
          _reduceButton(context, itemModel),
          _numButton(itemModel),
          _addButton(context, itemModel),
        ],
      ),
    );
  }

  // 减少按钮
  Widget _reduceButton(BuildContext context, CartModel model) {
    return InkWell(
      onTap: () {
        Provider.of<CartProvider>(context, listen: false).manageCount(model, false);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                width: 0.5,
                color: Colors.black12,
              ),
            )),
        child: Text("-"),
      ),
    );
  }

  // 增加按钮
  Widget _addButton(BuildContext context, CartModel model) {
    return InkWell(
      onTap: () {
        Provider.of<CartProvider>(context, listen: false).manageCount(model, true);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 0.5,
                color: Colors.black12,
              ),
            )),
        child: Text("+"),
      ),
    );
  }

  // 数量按钮
  Widget _numButton(CartModel item) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(70),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        child: Text("${item.count}"),
      ),
    );
  }
}
