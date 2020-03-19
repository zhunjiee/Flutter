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
      contentPadding:
          EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
      leading: CornerRadiusImage(
        imgUrl,
        radius: 8,
        width: 100,
        fit: BoxFit.fitWidth,
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
