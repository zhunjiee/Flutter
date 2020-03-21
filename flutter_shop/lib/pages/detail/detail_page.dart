import 'dart:math';

/**
 * @ClassName goods_detail
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-11 17:39
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provider/goods_detail_provider.dart';
import 'detail_top_area.dart';
import 'detail_explain.dart';
import 'detail_bottom.dart';
import 'detail_tab_bar.dart';
import 'detail_web.dart';

class GoodsDetail extends StatelessWidget {
  // 构造方法
  GoodsDetail(this.goodsId);

  final String goodsId;

  @override
  Widget build(BuildContext context) {
    _getBackInfo(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            print("返回上一页");
            Navigator.pop(context);
          },
        ),
        title: Text("商品详情"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: ScreenUtil().setWidth(100),
                  child: ListView(
                    children: <Widget>[
                      DetailTopArea(),
                      DetailExplain(),
                      DetailTabBar(),
                      DetailWeb(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: DetailBottom(),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: _getBackInfo(context),
      ),
    );
  }

  // 获取数据
  Future _getBackInfo(BuildContext context) async {
    await Provider.of<GoodsDetailProvider>(context, listen: false)
        .getGoodsDetailData(goodsId);
    print("商品编号为 {$goodsId} 的详情数据加载完成................");
    return "加载完成";
  }
}
