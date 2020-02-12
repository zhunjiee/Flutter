/**
 * @ClassName goods_detail
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-11 17:39
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/goods_detail_provider.dart';

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
      body: Container(
        child: Text("商品ID为:$goodsId"),
      ),
    );
  }

  //
  _getBackInfo(BuildContext context) async {
    await Provider.of<GoodsDetailProvider>(context, listen: false)
        .getGoodsDetailData(goodsId);
    print("加载完成................");
  }
}
