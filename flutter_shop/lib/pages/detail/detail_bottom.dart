/**
 * @ClassName detail_bottom
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-13 18:25
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../routers/application.dart';
import '../../provider/cart_provider.dart';
import '../../provider/goods_detail_provider.dart';
import '../../model/goods_detail_model.dart';
import '../../provider/current_index_provider.dart';

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoodInfo goodsInfo =
        Provider.of<GoodsDetailProvider>(context).detailModel.goodInfo;
    var goodsId = goodsInfo.goodsId;
    var goodsName = goodsInfo.goodsName;
    var count = 1;
    var price = goodsInfo.presentPrice;
    var images = goodsInfo.image1;

    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(100),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(110),
                height: ScreenUtil().setHeight(100),
                child: RaisedButton(
                  onPressed: () {
//                Application.router.navigateTo(context, "/cart");
                    Provider.of<CurrentIndexProvider>(context, listen: false)
                        .changeIndex(2);
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                    size: 30,
                  ),
                  color: Colors.white,
                ),
              ),

              Consumer<CartProvider>(builder: (context, cartProvider, _) {
                int allCount = cartProvider.allCount;
                return Positioned(
                  top: 0,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("$allCount", style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(22)),),
                  ),
                );
              }),
            ],
          ),

          Container(
            width: ScreenUtil().setWidth(320),
            height: ScreenUtil().setHeight(100),
            child: RaisedButton(
              onPressed: () async {
                await Provider.of<CartProvider>(context, listen: false)
                    .save(goodsId, goodsName, count, price, images);
              },
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
              onPressed: () async {
                await Provider.of<CartProvider>(context, listen: false).clear();
              },
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
