import 'package:flutter/material.dart';

enum SearchBarType {
  normal_page, // 放大镜在中间, 只是简单的占位搜索框,无法输入文字,点击后跳转到 search_page 类型的真正搜索框
  search_page, // 放大镜在左侧, 可输入文字的真正搜索框
}

typedef KeywordCallback = Function(String keyword);

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({
    Key key,
    this.hint = "搜索",
    this.defaultText,
    this.type = SearchBarType.normal_page,
    this.inputOnTap,
    this.cancelOnTap,
    this.keywordCallback,
  }) : super(key: key);

  final String hint; // 占位文字
  final String defaultText; // 默认文字
  final SearchBarType type; // 默认文字
  final VoidCallback inputOnTap; // 输入框点击事件 - 跳转到真正的搜素页面
  final VoidCallback cancelOnTap; // 取消事件
  final KeywordCallback keywordCallback; // 取消事件

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool showClear = false;
  TextEditingController _controller;

  // ------------ life cycle ------------

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch(widget.type){
      case SearchBarType.normal_page:
        return _normalPageBar();
      case SearchBarType.search_page:
        return _searchPageBar();
      default:
        return _normalPageBar();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // ------------ Methods ------------

  /// 搜索框文字改变
  void _onChanged(String value) {
    print("onChanged : $value");
    if (value.isNotEmpty) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.keywordCallback != null) widget.keywordCallback(value);
  }

  // ------------ Widgets ------------

  /// 只显示的搜索框组件,点击跳转到真正的搜索页面
  Widget _normalPageBar() {
    return GestureDetector(
      onTap: widget.inputOnTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 34,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 6),
              child: Icon(
                Icons.search,
                size: 20,
                color: Colors.grey[400],
              ),
            ),
            Text(
              widget.hint,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  /// 带实际功能的搜索框
  Widget _searchPageBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          // 搜索框
          _buildSearchBar(),
          // 取消按钮
          _buildCancelButton(),
        ],
      ),
    );
  }

  // 搜索框
  Widget _buildSearchBar() {
    return Expanded(
      // 白色圆角背景
      child: Container(
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Stack(
          children: <Widget>[
            TextField(
              controller: _controller,
              onChanged: _onChanged,
              autofocus: true,
              style: TextStyle(fontSize: 16, color: Colors.black87),
              decoration: InputDecoration(
                icon: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey[400],
                  ),
                ),
                border: InputBorder.none, // 去除下划线
                hintText: widget.hint,
                hintStyle: TextStyle(fontSize: 14),
                contentPadding: EdgeInsets.fromLTRB(-10, 0, -10, 13), // 调整文字位置
                suffixIcon: showClear ? _buildClearButton() : null, // 清除按钮
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 取消按钮
  Widget _buildCancelButton() {
    return Container(
      width: 60,
      child: FlatButton(
        child: Text(
          "取消",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w100,
              color: Colors.blue[900]),
        ),
        onPressed: widget.cancelOnTap == null
            ? () => Navigator.of(context).pop()
            : widget.cancelOnTap,
        padding: EdgeInsets.symmetric(horizontal: 0),
      ),
    );
  }

  // 创建清空按钮
  Widget _buildClearButton() {
    // 取消默认宽高约束
    return UnconstrainedBox(
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(9),
        ),
        child: GestureDetector(
          onTap: () {
            // 直接清空报错,可能是因为没有清空时光标还在原来的位置有关
            // 保证在组件build的第一帧时才去触发取消清空内容
            WidgetsBinding.instance
                .addPostFrameCallback((_) => _controller.clear());
            setState(() {
              showClear = false;
            });
          },
          child: Icon(Icons.close, color: Colors.white, size: 16),
        ),
      ),
    );
  }
}
