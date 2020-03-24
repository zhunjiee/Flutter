import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/widget_corner_radius_image.dart';
import '../../common/common_text_style.dart';

class ChatListItem extends StatelessWidget {
  ChatListItem(this.imgUrl, this.name, this.lastMsg, this.timeStr,
      {this.onItemTap});

  final String imgUrl;
  final String name;
  final String lastMsg;
  final String timeStr;
  final VoidCallback onItemTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(30), vertical: 0),
          leading:
              _clipCornerRadiusImage(imgUrl, 4, ScreenUtil().setWidth(100)),
          title: Text(name),
          subtitle: Text(lastMsg),
          trailing: Text(
            timeStr,
            style: smallGrayTextStyle,
          ),
          onTap: onItemTap,
        ),
      ],
    );
  }

  /// 带占位图片的圆角图片
  Widget _clipCornerRadiusImage(String url, double radius, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: FadeInImage.assetNetwork(
        placeholder: "images/default_nor_avatar.png",
        image: url,
        width: width,
        height: width,
      ),
    );
  }
}
