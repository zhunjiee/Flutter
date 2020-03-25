/**
 * @ClassName mine_header
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/21 11:46 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/widget_corner_radius_image.dart';
import '../../widgets/v_empty_view.dart';
import '../../widgets/h_empty_view.dart';

class MineHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setWidth(200),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CornerRadiusImage(
              "images/avatar.png",
              width: ScreenUtil().setWidth(110),
              radius: ScreenUtil().setWidth(8),
            ),
            Container(
              height: ScreenUtil().setWidth(110),
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "侯歌",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(580),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "微信号: zhunjiee",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12, color: Colors.black38),
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "images/ic_qrcode_preview_tiny.png",
                              width: 15,
                              height: 15,
                            ),
                            HEmptyView(10),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
