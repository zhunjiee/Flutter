/**
 * @ClassName detail_tab_bar
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-13 20:21
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provider/goods_detail_provider.dart';
import 'package:provider/provider.dart';

class DetailTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLeft = Provider.of<GoodsDetailProvider>(context).isLeft;
    bool isRight = Provider.of<GoodsDetailProvider>(context).isRight;
    return Container(
      height: ScreenUtil().setHeight(80),
      child: Row(
        children: <Widget>[
          _customTabBarLeftItem(context, isLeft),
          _customTabBarRightItem(context, isRight),
        ],
      ),
    );
  }

  Widget _customTabBarLeftItem(BuildContext context, bool isLeft) {
    return GestureDetector(
      onTap: () {
        print(isLeft);
        Provider.of<GoodsDetailProvider>(context, listen: false).selectLeftOrRight(0);
      },
      child: Container(
        width: ScreenUtil().setWidth(375),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: isLeft ? Colors.red : Colors.black12),
          ),
        ),
        child: Text(
          "详情",
          style: TextStyle(
            color: isLeft ? Colors.red : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _customTabBarRightItem(BuildContext context, bool isRight) {
    return GestureDetector(
      onTap: () {
        print(isRight);
        Provider.of<GoodsDetailProvider>(context, listen: false).selectLeftOrRight(1);
      },
      child: Container(
        width: ScreenUtil().setWidth(375),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: isRight ? Colors.red : Colors.black12),
          ),
        ),
        child: Text(
          " 评论",
          style: TextStyle(
            color: isRight ? Colors.red : Colors.black,
          ),
        ),
      ),
    );
  }
}
