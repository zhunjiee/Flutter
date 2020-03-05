/**
 * @ClassName discover_category
 * @Description 分类列表
 * @Author HouGe
 * @Date 2020-02-27 11:00
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/v_placeholder_view.dart';
import '../../utils/common_color.dart';
import '../../utils/navigator_utils.dart';

class DiscoverCategory extends StatelessWidget {
  DiscoverCategory(this.category);

  final Map category;

  @override
  Widget build(BuildContext context) {
    List categoryKeys = category.keys.toList();
    // 自定义一行显示的GridView,不管几个都在一行显示
    return GridView.custom(
      shrinkWrap: true, // 自动换行
      physics: NeverScrollableScrollPhysics(), // 禁止滚动
      padding: EdgeInsets.only(bottom: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: categoryKeys.length,
        childAspectRatio: 1 / 1.1,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent, // 点击事件自己也可以处理
            onTap: () {
              if (index == 0) {
                // 每日推荐
                NavigatorUtils.goDailySongsPage(context);
              } else if (index == 2) {
                // 排行榜
                NavigatorUtils.goTopListPage(context);
              }
            },
            child: _gridItem(categoryKeys[index], index),
          );
        },
        childCount: categoryKeys.length,
      ),
    );
  }

  Widget _gridItem(String categoryKey, int index) {
    double width = ScreenUtil().setWidth(100);
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width / 2),
                border: Border.all(color: Colors.black12, width: 0.5),
                gradient: RadialGradient(
                  colors: [
                    Color(0xFFFF8174),
                    Colors.red,
                  ],
                  center: Alignment(-1.7, 0),
                  radius: 1,
                ),
                color: Colors.red,
              ),
            ),
            Image.asset(
              category[categoryKey],
              width: width,
              height: width,
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: categoryKey == '每日推荐'
                  ? Text(
                      '${DateUtil.formatDate(DateTime.now(), format: 'dd')}',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  : Text(''),
            )
          ],
        ),
        VerticalPlaceholderView(10),
        Text(
          "$categoryKey",
          style: TextStyle(color: commonTextColor, fontSize: 14),
        ),
      ],
    );
  }
}
