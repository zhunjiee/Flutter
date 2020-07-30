/// @ClassName home_hot_goods
/// @Description TODO
/// @Author HouGe
/// @Date 2020/7/29 4:50 PM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home_model.dart';
import '../../config/common_text_style.dart';

class HomeHotGoods extends StatelessWidget {
  HomeHotGoods(this.hotGoodsList);

  final List<HotGoodsModel> hotGoodsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _hotGoodsTitle(),
        ],
      ),
    );
  }

  /// 标题
  Widget _hotGoodsTitle() {
    return Container(
      child: Text("火爆专区", textAlign: TextAlign.center, style: mBlackBoldTextStyle,),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(5),
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12),
        ),
      ),
    );
  }
}
