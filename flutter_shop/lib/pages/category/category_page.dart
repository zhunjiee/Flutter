/**
 * @ClassName category_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-01 19:25
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../config/http_request.dart';
import '../../model/category_model.dart';

class CategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    getCategory().then((value){
      CategoryListModel listModel = CategoryListModel.fromList(value);
      listModel.categoryListData.forEach((item){
        CategoryModel model = item;
        print(model.mallCategoryName);
      });

      print("listModel.toList() = ${listModel.toList()}");
    });

    return Scaffold(
      body: Center(
        child: Text("分类"),
      ),
    );
  }
}