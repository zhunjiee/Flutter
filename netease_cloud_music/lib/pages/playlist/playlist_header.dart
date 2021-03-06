/**
 * @ClassName widget_playlist_header
 * @Description 歌单列表滚动时可以驻留在顶部的组件
 * @Author HouGe
 * @Date 2020-02-29 20:52
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/provider/play_music_provider.dart';
import '../../utils/common_text_style.dart';
import '../../widgets/h_placeholder_view.dart';

//typedef PlayMusicCallback = void Function(PlayMusicProvider provider);
typedef void PlayMusicCallback(PlayMusicProvider provider);

class PlaylistHeader extends StatelessWidget
    implements PreferredSizeWidget {
  PlaylistHeader({this.count, this.tail, this.onTap});

  final int count;
  final Widget tail;  // 尾部附加控件
  final VoidCallback onTap;

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setWidth(100));

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(ScreenUtil().setWidth(30)),
      ),
      child: Container(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: SizedBox.fromSize(
            size: preferredSize,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                HorizontalPlaceholderView(20),
                Icon(
                  Icons.play_circle_outline,
                  size: ScreenUtil().setWidth(50),
                ),
                HorizontalPlaceholderView(6),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Text(
                    "播放全部",
                    style: mCommonTextStyle,
                  ),
                ),
                HorizontalPlaceholderView(5),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: count == null
                      ? Container()
                      : Text(
                          "共$count首",
                          style: smallGrayTextStyle,
                        ),
                ),
                Spacer(),
                tail ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
