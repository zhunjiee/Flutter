/**
 * @ClassName mine_playlist_title
 * @Description TODO
 * @Author houge
 * @Date 2020/3/13 4:22 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/common_text_style.dart';
import '../../widgets/h_placeholder_view.dart';

class MinePlaylistTile extends StatefulWidget {
  MinePlaylistTile(this.title, this.count, {this.onSwitchTap, this.onMoreTap,
      this.trailing});

  final String title;
  final int count;
  final VoidCallback onSwitchTap;
  final VoidCallback onMoreTap;
  final Widget trailing; // 更多前面的组件(+)

  @override
  _MinePlaylistTileState createState() => _MinePlaylistTileState();
}

class _MinePlaylistTileState extends State<MinePlaylistTile> {
  List<String> arrows = [
    'images/icon_up.png', // 闭合
    'images/icon_down.png', // 展开
  ];
  String arrow;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    arrow = arrows[0];  // 默认闭合
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(80),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {
            if (arrow == arrows[0]) {
              // 展开
              arrow = arrows[1];
            } else {
              // 闭合
              arrow = arrows[0];
            }
            widget.onSwitchTap();
          });
        },
        child: Row(
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Image.asset(
                arrow,
                key: ValueKey(arrow), // key发生变化会执行AnimatedSwitcher
                width: ScreenUtil().setWidth(30),
              ),
            ),
            HorizontalPlaceholderView(10),
            Text(
              widget.title,
              style: bold18TextStyle,
            ),
            HorizontalPlaceholderView(5),
            Text("(${widget.count})"),
            Spacer(),
            widget.trailing ?? Container(),
            SizedBox(
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setWidth(70),
              child: IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black87,
                ),
                onPressed: widget.onMoreTap,
                padding: EdgeInsets.zero,
              ),
            )
          ],
        ),
      ),
    );
  }
}
