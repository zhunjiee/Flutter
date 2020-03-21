/**
 * @ClassName detail_web
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-13 23:05
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../provider/goods_detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../model/goods_detail_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoodInfo goodsInfo = Provider.of<GoodsDetailProvider>(context).detailModel.goodInfo;
    bool isLeft = Provider.of<GoodsDetailProvider>(context).isLeft;
    if (isLeft) {
      return Container(
        child: Html(data: goodsInfo.goodsDetail),
      );
    } else {
      return Container(
        height: ScreenUtil().setWidth(200),
        child: Center(
          child: Text("暂无评论"),
        ),
      );
    }
  }
}
