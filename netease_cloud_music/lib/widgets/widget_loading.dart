/**
 * @ClassName loading_widget
 * @Description 显示正在加载中的组件
 * @Author HouGe
 * @Date 2020-02-20 22:16
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Loading {
  static bool isLoading = false;

  // 显示
  static void showLoading(BuildContext context) {
    if (!isLoading) {
      isLoading = true;
      // 自定义弹出框
      showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Align(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.black45,
                child: CupertinoActivityIndicator(),
              ),
            ),
          );
        },
        barrierDismissible: false, // 是否可以点击背景关闭
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionDuration: Duration(milliseconds: 150),  // 从开始到完全显示的时间
      ).then((v){
        isLoading = false;
      });
    }
  }

  // 隐藏
  static void hideLoading(BuildContext context) {
    if (isLoading) {
        Navigator.of(context).pop();
    }
  }
}
