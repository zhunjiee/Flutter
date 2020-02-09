/**
 * @ClassName category_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-01 19:25
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'category_left_navigator.dart';
import 'category_right_navigator.dart';
import 'category_goods_list.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNavigator(),
            Column(
              children: <Widget>[
                RightCategoryNavigator(),
                CategoryGoodsList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
