/**
 * @ClassName detail_top_area
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-12 22:38
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provider/goods_detail_provider.dart';
import '../../model/goods_detail_model.dart';

class DetailTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoodsDetailProvider>(
      builder: (context, goodsDetailProvider, _) {
        GoodInfo goodsInfo = goodsDetailProvider.detailModel.goodInfo;
        if (goodsInfo != null) {
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _goodsBigImage(goodsInfo.image1),
                _goodsName(goodsInfo.goodsName),
                _goodsNumber(goodsInfo.goodsSerialNumber),
                _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice),
              ],
            ),
          );
        } else {
          return Text("正在加载中...");
        }
      },
    );
  }

  // 商品大图
  Widget _goodsBigImage(String src) {
    return Image.network(
      src,
      width: ScreenUtil().setWidth(740),
    );
  }

  // 商品名称
  Widget _goodsName(String name) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  // 商品编号
  Widget _goodsNumber(String number) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8),
      child: Text(
        "编号:$number",
        style: TextStyle(
          color: Colors.black26,
        ),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(double presentPrice, double oriPrice) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Text(
            "¥$presentPrice",
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: ScreenUtil().setSp(40),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              "市场价:¥$oriPrice",
              style: TextStyle(
                color: Colors.black26,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
