/// @ClassName widget_net_error
/// @Description 网络请求错误组件
/// @Author HouGe
/// @Date 2020/7/30 1:39 PM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/common_text_style.dart';
import 'v_empty_view.dart';

class NetErrorWidget extends StatelessWidget {
  NetErrorWidget({this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Column(
        // 利用Column实现占满屏幕并居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _errorChildWidget(),
        ],
      ),
    );
  }

  Widget _errorChildWidget() {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Icon(
            Icons.error_outline,
            size: ScreenUtil().setWidth(80),
          ),
          VerticalEmptyView(),
          Text(
            "点击重新请求",
            style: commonTextStyle,
          )
        ],
      ),
    );
  }
}
