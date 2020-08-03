/**
 * @ClassName category
 * @Description TODO
 * @Author Houge
 * @Date 2020/6/12 8:57 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'category_left_navigator.dart';
import 'category_top_navigator.dart';
import 'category_goods_list.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分类"),
      ),
      body: SafeArea(
        child: Container(
          child: Row(
            children: <Widget>[
              LeftCategoryNavigator(),
              Column(
                children: <Widget>[
                  TopCategoryNavigator(),
                  CategoryGoodsList(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
