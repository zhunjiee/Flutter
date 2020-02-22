/**
 * @ClassName widget_net_error
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-21 20:51
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'v_placeholder_view.dart';
import 'common_text_style.dart';

class NetErrorWidget extends StatelessWidget {
  NetErrorWidget({@required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        child: Column(
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: ScreenUtil().setWidth(80),
            ),
            VerticalPlaceholderView(height: 10),
            Text(
              "点击重新请求",
              style: commonTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
