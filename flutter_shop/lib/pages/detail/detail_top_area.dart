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
        DetailModel detailModel = goodsDetailProvider.detailModel;
        return Container(
          child: Column(
            children: <Widget>[
              _goodsBigImage(detailModel.goodInfo.image1),
            ],
          ),
        );
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
}
