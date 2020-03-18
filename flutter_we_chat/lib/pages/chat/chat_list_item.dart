import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/widget_corner_radius_image.dart';
import '../../common/common_text_style.dart';

class ChatListItem extends StatelessWidget {
  ChatListItem(this.imgUrl, this.name, this.lastMsg, this.timeStr);

  final String imgUrl;
  final String name;
  final String lastMsg;
  final String timeStr;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: ScreenUtil().setWidth(100),
        height: ScreenUtil().setWidth(100),
        alignment: Alignment.center,
        child: CornerRadiusImage(
          "images/avatar.png",
          width: ScreenUtil().setWidth(100),
        ),
      ),
      title: Text(name),
      subtitle: Text(lastMsg),
      trailing: Text(
        timeStr,
        style: smallGrayTextStyle,
      ),
    );
  }
}
