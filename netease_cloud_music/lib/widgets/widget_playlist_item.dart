/**
 * @ClassName widget_playlist_item
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-03 18:51
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/h_placeholder_view.dart';
import '../widgets/v_placeholder_view.dart';
import '../widgets/widget_corner_radius_image.dart';
import '../utils/common_text_style.dart';
import '../model/music_model.dart';

class PlaylistItem extends StatelessWidget {
  PlaylistItem(this._data, {this.onTap});

  final MusicData _data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        color: Colors.white,
        height: ScreenUtil().setWidth(120),
        child: Row(
          children: <Widget>[
            _data.index == null && _data.picUrl == null
                ? Container()
                : HorizontalPlaceholderView(15),
            _data.picUrl == null
                ? Container()
                : CornerRadiusImage(
                    "${_data.picUrl}?param=150y150",
                    width: 100,
                    height: 100,
                    radius: 10,
                  ),
            _data.index == null
                ? Container()
                : Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(60),
                    height: ScreenUtil().setWidth(50),
                    child: Text(_data.index.toString(), style: mGrayTextStyle),
                  ),
            _data.index == null && _data.picUrl == null
                ? Container()
                : HorizontalPlaceholderView(10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _data.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: commonTextStyle,
                  ),
                  VerticalPlaceholderView(10),
                  Text(
                    _data.artists,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: smallGrayTextStyle,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: _data.mvId == 0
                  ? Container()
                  : IconButton(
                      icon: Icon(Icons.play_circle_outline),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
            ),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
