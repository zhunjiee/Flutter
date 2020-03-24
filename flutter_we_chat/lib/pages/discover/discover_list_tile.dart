/**
 * @ClassName discover_list_tile
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/21 10:54 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscoverListTile extends StatelessWidget {
  DiscoverListTile(this.src, this.title, {this.showSeparator = false});

  final String src;
  final String title;
  final bool showSeparator; // 是否显示底部分割线

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(70),
                height: ScreenUtil().setWidth(100),
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  src,
                  width: ScreenUtil().setWidth(45),
                  height: ScreenUtil().setWidth(45),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 15,
                ),
              ),
            ],
          ),
          // 分割线
          Divider(
            indent: ScreenUtil().setWidth(70),
            thickness: 0.5, // 这才是分割线的宽度
            color: showSeparator ? Colors.grey[400] : Colors.transparent,
            height: 0, // 分割线的默认上下距离设为0
          ),
        ],
      ),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      fillColor: Colors.white,  // 背景颜色
      elevation: 0, // 去除阴影
      highlightElevation: 0,  // 去除高亮阴影
    );

    return Container(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      color: Colors.white,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(70),
                  height: ScreenUtil().setWidth(100),
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    src,
                    width: ScreenUtil().setWidth(45),
                    height: ScreenUtil().setWidth(45),
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 15,
                  ),
                ),
              ],
            ),
            // 分割线
            Divider(
              indent: ScreenUtil().setWidth(70),
              thickness: 0.5,
              color: showSeparator ? Colors.grey[400] : Colors.white,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
