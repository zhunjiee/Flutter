/**
 * @ClassName custom_refresh_header_footer
 * @Description 封装 EasyRefresh 的统一样式的 Header Footer
 * @Author Houge
 * @Date 2020/3/21 4:58 PM
 * @Version 1.0
 */

import 'package:flutter_easyrefresh/easy_refresh.dart';

class CustomRefreshHeaderFooter {
  /// Header
  static Header getHeader() {
    return ClassicalHeader(
      refreshText: "下拉刷新",
      refreshReadyText: "松手刷新",
      refreshingText: "正在刷新中...",
      refreshedText: "刷新完成",
      refreshFailedText: "刷新失败",
      noMoreText: "没有相关数据",
      showInfo: false, // 不显示时间
      enableHapticFeedback: false, // 取消震动反馈
    );
  }

  /// Footer
  static Footer getFooter() {
    return ClassicalFooter(
      // 如何显示中文还没找到好的办法
      loadText: "上拉加载更多",
      loadReadyText: "松手加载",
      loadingText: "正在加载中...",
      loadedText: "加载完成",
      loadFailedText: "加载失败",
      noMoreText: "已经到底了",
      showInfo: false, // 不显示时间
      enableInfiniteLoad: false, // 取消无限加载,隐藏footer
      enableHapticFeedback: false, // 取消震动反馈
    );
  }
}