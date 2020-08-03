/// @ClassName home_recommend_goods
/// @Description TODO
/// @Author HouGe
/// @Date 2020/7/31 10:58 AM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home_model.dart';
import '../../widgets/widget_net_image.dart';
import '../../config/common_text_style.dart';

class RecommendGoods extends StatelessWidget {
  RecommendGoods(this.recommendList);

  final List<Recommend> recommendList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _recommendTitle(),
        _recommendGoods(recommendList),
      ],
    );
  }

  /// 商品标题
  Widget _recommendTitle() {
    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
      child: Text(
        "商品推荐",
        style: TextStyle(
          color: Colors.pink,
          fontSize: ScreenUtil().setSp(30),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _recommendGoods(List<Recommend> recommendList) {
    return Container(
      height: ScreenUtil().setWidth(350),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          vertical: BorderSide(width: 0.5, color: Colors.black12),
        ),
      ),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _recommendItem(recommendList[index]);
        },
        itemCount: recommendList.length,
        // 分割线
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 2,
            color: Colors.green,
          );
        },
        scrollDirection: Axis.horizontal, // 滚动方向
      ),
    );
  }

  Widget _recommendItem(Recommend model) {
    return GestureDetector(
      onTap: () {
        print(model.goodsName);
      },
      child: Container(
        width: ScreenUtil().setWidth(250),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.black12),
          ),
        ),
        child: Column(
          children: <Widget>[
            NetImageWidget(
              model.image,
              width: 250,
            ),
            Text(
              model.goodsName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "¥${model.mallPrice}",
                  style: common13TextStyle,
                ),
                Text(
                  "¥${model.price}",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
