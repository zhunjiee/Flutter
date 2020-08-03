/// @ClassName home_floor
/// @Description 首页-楼层展示
/// @Author HouGe
/// @Date 2020/7/31 1:40 PM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/widget_net_image.dart';
import '../../model/home_model.dart';
import '../../widgets/v_empty_view.dart';

class HomeFloor extends StatelessWidget {
  HomeFloor(this.floorImgSrc, this.floorGoodsList);

  final String floorImgSrc;
  final List<Floor> floorGoodsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _floorTitle(),
          _firstFloorGoods(),
          _secondFloorGoods(),
          VerticalEmptyView(height: 20, color: Color.fromARGB(255, 239, 239, 239),),
        ],
      ),
    );
  }

  /// 楼层标题
  Widget _floorTitle() {
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Image.network(floorImgSrc),
    );
  }

  /// 前三个商品固定:1+2
  Widget _firstFloorGoods() {
    return Row(
      children: <Widget>[
        _floorGoodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _floorGoodsItem(floorGoodsList[1]),
            _floorGoodsItem(floorGoodsList[2]),
          ],
        ),
      ],
    );
  }

  /// 其他商品
  Widget _secondFloorGoods() {
    return Row(
      children: <Widget>[
        _floorGoodsItem(floorGoodsList[3]),
        _floorGoodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _floorGoodsItem(Floor model) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: GestureDetector(
        onTap: () {
          print(model.goodsId);
        },
        child: Image.network(model.image),
      ),
    );
  }
}
