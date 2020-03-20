import 'package:flutter/material.dart';
import 'package:flutterwechat/common/common_const.dart';
import '../pages/search/search_page.dart';
import 'h_empty_view.dart';
import '../temp/add_list_temp_data.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("微信"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search, color: Colors.black87),
          onPressed: () => _jumpToSearchPage(context),
        ),
        PopupMenuButton(
          color: Color(0xff4c4c4c),
          offset: Offset(0, 46),
          itemBuilder: (context) {
            return AddListTempData.modelList.addList.map((e) {
              return PopupMenuItem(
                  child: _popupMenuChild(e.icon, e.name),
                value: e.name,
              );
            }).toList();
          },
          icon: Icon(
            Icons.add_circle_outline,
            color: Colors.black87,
          ),
          onSelected: (value){
            print(value);
          },
          onCanceled: (){
            print("onCanceled");
          },
        ),
      ],
    );
  }

  /// 跳转到搜索页面
  void _jumpToSearchPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchPage(),
      ),
    );
  }

  /// +号 弹窗子组件
  Widget _popupMenuChild(int iconData, String name) {
    return Row(
      children: <Widget>[
        Icon(
          IconData(iconData, fontFamily: ICON_FONT),
          size: 22,
          color: Colors.white,
        ),
        HEmptyView(12),
        Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
