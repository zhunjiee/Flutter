/// @ClassName custom_future_builder
/// @Description 自定义FutureBuilder, 显示 加载中小圆圈 及 点击重试 小组件
/// @Author HouGe
/// @Date 2020/7/30 2:18 PM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget_net_error.dart';

typedef ValueWidgetBuilder<T> = Widget Function(BuildContext context, T value);

class CustomFutureBuilder<T> extends StatefulWidget {
  CustomFutureBuilder({
    @required this.builder,
    @required this.futureFunc,
    this.params,
    Widget loadingWidget,
  }) : loadingWidget = loadingWidget ?? Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ],
  );

  final ValueWidgetBuilder<T> builder;
  final Function futureFunc;
  final Map<String, dynamic> params;
  final Widget loadingWidget;

  @override
  _CustomFutureBuilderState<T> createState() => _CustomFutureBuilderState<T>();
}

class _CustomFutureBuilderState<T> extends State<CustomFutureBuilder<T>> {
  Future<T> _future;
  String oldParams = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 是 StatefulWidget 渲染结束的回调，只会被调用一次，之后 StatefulWidget 需要刷新 UI 也不会被调用
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _request();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void didUpdateWidget(CustomFutureBuilder<T> oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

  }

  void _request() {
    setState(() {
      if (widget.params == null) {
        _future = widget.futureFunc();
      } else {
        _future = widget.futureFunc(params: widget.params);
        oldParams = widget.params.values.join();  // join() 方法用于把数组中的所有元素放入一个字符串
      }
    });
  }
}
