/**
 * @ClassName custom_future_builder
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-26 19:38
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget_net_error.dart';

typedef ValueWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

/// FutureBuilder 简单封装，除正确返回和错误外，其他返回 小菊花
/// 错误时返回定义好的错误 Widget，例如点击重新请求
class CustomFutureBuilder<T> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final Function future;
  final Map<String, dynamic> params;
  final Widget loadingWidget;

  CustomFutureBuilder({
    @required this.builder,
    @required this.future,
    this.params,
    Widget loadingWidget,
  }) : loadingWidget = loadingWidget ??
            Container(
              height: ScreenUtil().setHeight(100),
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );

  @override
  _CustomFutureBuilderState<T> createState() => _CustomFutureBuilderState<T>();
}

class _CustomFutureBuilderState<T> extends State<CustomFutureBuilder<T>> {
  Future<T> _future;
  String oldParams = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      _request();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _future == null
        ? widget.loadingWidget
        : FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return widget.loadingWidget;
                case ConnectionState.done:
                  print("snapshot.data-----:------: ${snapshot.error}");
                  if (snapshot.hasData) {
                    return widget.builder(context, snapshot.data);
                  } else if (snapshot.hasError) {
                    return NetErrorWidget(callback: () {
                      _request();
                    });
                  }
              }
              return Container();
            });
  }

  @override
  void didUpdateWidget(CustomFutureBuilder<T> oldWidget) {
    // 如果方法不一样了,那么重新请求
    if (oldWidget.future != widget.future) {
      print("function not");
      WidgetsBinding.instance.addPostFrameCallback((call) {
        _request();
      });
    }
    // 如果方法还一样，但是参数不一样了，则重新请求
    if ((oldWidget.future == widget.future) && (oldWidget.params != null) && (widget.params != null)) {
      if (oldParams != widget.params.values.join()) {
        print("params not");
        oldParams = widget.params.values.join();
        WidgetsBinding.instance.addPostFrameCallback((call) {
          _request();
        });
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  void _request() {
    setState(() {
      if (widget.params == null) {
        _future = widget.future(context);
      } else {
        _future = widget.future(context, params: widget.params);
        oldParams = widget.params.values.join();
      }
    });
  }
}