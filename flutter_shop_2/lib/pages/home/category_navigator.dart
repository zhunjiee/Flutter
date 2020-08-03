/// @ClassName home_category_navigator
/// @Description 分类导航
/// @Author HouGe
/// @Date 2020/7/27 5:38 PM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttershop2/config/common_text_style.dart';
import '../../model/home_model.dart';

typedef CategoryOnTapCallback = void Function(Category category);

class CategoryNavigator extends StatelessWidget {
  CategoryNavigator(this.categoryList, {this.onTapAction});

  final List<Category> categoryList;
  final CategoryOnTapCallback onTapAction;

  @override
  Widget build(BuildContext context) {
    num height = categoryList.length > 5 ? 330 : 165;
    return Container(
      color: Colors.white,
      height: ScreenUtil().setWidth(height),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: GridView.count(
        crossAxisCount: 5,
        children: categoryList.map((item) => _categoryItem(item)).toList(),
        padding: EdgeInsets.all(5),
        physics: NeverScrollableScrollPhysics(), // 禁止滚动
      ),
    );
  }

  Widget _categoryItem(Category category) {
    return InkWell(
      onTap: () {
        onTapAction(category);
      },
      child: Column(
        children: <Widget>[
          Image.network(
            category.image,
            width: ScreenUtil().setWidth(95),
            height: ScreenUtil().setWidth(95),
            fit: BoxFit.cover,
            frameBuilder: (
              BuildContext context,
              Widget child,
              int frame,
              bool wasSynchronouslyLoaded,
            ) {
              if (frame == null) {
                // 占位图片
                return Image.asset(
                  "assets/images/placeholder_image.png",
                  width: ScreenUtil().setWidth(95),
                  height: ScreenUtil().setWidth(95),
                  fit: BoxFit.cover,
                );
              }
              return child;
            },
          ),
          Text(category.mallCategoryName, style: common14TextStyle,),
        ],
      ),
    );
  }
}
