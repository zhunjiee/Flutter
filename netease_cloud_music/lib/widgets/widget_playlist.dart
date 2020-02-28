/**
 * @ClassName widget_playlist
 * @Description 歌单/新碟商家等组件
 * @Author HouGe
 * @Date 2020-02-27 19:31
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget_playlist_cover.dart';
import '../utils/common_text_style.dart';
import 'v_placeholder_view.dart';

class PlaylistWidget extends StatelessWidget {
  PlaylistWidget({
    this.url,
    @required this.title,
    this.subtitle,
    this.playCount,
    this.maxLines = -1,
    this.onTap,
    this.index,
  });

  final String url;
  final String title;
  final String subtitle;
  final num playCount;
  final int maxLines;
  final VoidCallback onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: ScreenUtil().setWidth(200),
        child: Column(
          children: <Widget>[
            // 封面
            url == null
                ? Container()
                : PlaylistCover(
                    url,
                    playCount: playCount,
                  ),
            //
            index == null
                ? Container()
                : Text(
                    index.toString(),
                    style: commonGrayTextStyle,
                  ),
            VerticalPlaceholderView(5),
            // 标题
            Text(
              title,
              style: smallCommonTextStyle,
              maxLines: maxLines != -1 ? maxLines : null,
              overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
            ),
            subtitle == null ? Container() : VerticalPlaceholderView(2),
            subtitle == null
                ? Container()
                : Text(
                    subtitle,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                    maxLines: maxLines != -1 ? maxLines : null,
                    overflow: maxLines != -1 ? TextOverflow.ellipsis : null,
                  ),
          ],
        ),
      ),
    );
  }
}
