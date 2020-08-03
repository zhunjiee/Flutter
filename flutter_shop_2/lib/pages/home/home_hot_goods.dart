/// @ClassName home_hot_goods
/// @Description 首页-火爆专区
/// @Author HouGe
/// @Date 2020/7/29 4:50 PM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home_model.dart';
import '../../config/common_text_style.dart';
import '../../widgets/widget_net_image.dart';

class HomeHotGoods extends StatelessWidget {
  HomeHotGoods(this.hotGoodsList);

  final List<HotGoodsModel> hotGoodsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _hotGoodsTitle(),
          _hotGoodsGridView(),
        ],
      ),
    );
  }

  /// 标题
  Widget _hotGoodsTitle() {
    return Container(
      child: Text(
        "火爆专区",
        textAlign: TextAlign.center,
        style: mBlackBoldTextStyle,
      ),
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

  /// 商品网格
  Widget _hotGoodsGridView() {
    if (hotGoodsList.isNotEmpty) {
      List<Widget> listWidget = hotGoodsList.map((e) => _hotItem(e)).toList();
      return GridView.count(
        crossAxisCount: 2,
        children: listWidget,
        childAspectRatio: 373.0 / 480.0,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(), // 禁止滚动
      );
    } else {
      return Container();
    }
  }

  /// 单个商品
  Widget _hotItem(HotGoodsModel model) {
    return GestureDetector(
      onTap: () {
        print(model.name);
      },
      child: Container(
        width: ScreenUtil().setWidth(373),
        height: ScreenUtil().setWidth(373),
        padding: EdgeInsets.all(5),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            NetImageWidget(
              model.image,
              width: 363,
              height: 363,
            ),
            Text(
              model.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                height: 2.0,
                color: Colors.pink,
                fontSize: ScreenUtil().setSp(26),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("¥${model.mallPrice}"),
                Text(
                  "¥${model.price}",
                  style: TextStyle(
                    color: Colors.black26,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
