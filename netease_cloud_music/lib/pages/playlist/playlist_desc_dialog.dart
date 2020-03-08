import 'dart:ui';

/**
 * @ClassName playlist_desc_dialog
 * @Description 歌单详情弹出页
 * @Author houge
 * @Date 2020/3/8 2:16 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/playlist_model.dart';
import '../../widgets/v_placeholder_view.dart';
import '../../widgets/h_placeholder_view.dart';
import '../../widgets/widget_corner_radius_image.dart';
import '../../utils/utils.dart';
import '../../utils/common_text_style.dart';
import '../../application.dart';
import '../../widgets/widget_tag.dart';

class PlaylistDescDialog extends StatelessWidget {
  PlaylistDescDialog(this.playlist);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: <Widget>[
            // 图片占满全屏
            Utils.showNetImage(
              "${playlist.coverImgUrl}?param=200y200",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            // 给图片添加高斯模糊
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                color: Colors.black38,
              ),
            ),
            SafeArea(
              bottom: false,
              child: Stack(
                children: <Widget>[
                  // 歌单详情
                  _playlistDetailInfoView(),
                  // 关闭按钮, 注意层级问题,不然按钮点不动
                  _closeButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 关闭按钮
  Widget _closeButton(BuildContext context) {
    return Positioned(
      right: ScreenUtil().setWidth(40),
      top: ScreenUtil().setHeight(20),
      child: IconButton(icon: Icon(
        Icons.close,
        color: Colors.white,
        size: ScreenUtil().setWidth(60),
      ), onPressed: (){
        Navigator.of(context).pop();
      }),
    );
  }

  /// 歌单详情
  Widget _playlistDetailInfoView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(100)),
        child: Column(
          children: <Widget>[
            VerticalPlaceholderView(150),
            Align(
              alignment: Alignment.topCenter,
              child: CornerRadiusImage(
                "${playlist.coverImgUrl}?param=200y200",
                width: 400,
                height: 400,
                radius: 10,
              ),
            ),
            VerticalPlaceholderView(40),
            Text(
              playlist.name,
              textAlign: TextAlign.center,
              style: mWhiteBoldTextStyle,
              softWrap: true,
            ),
            VerticalPlaceholderView(40),
            Image.asset(
              "images/icon_line_1.png",
              width: Application.screenWidth * 3 / 4,
            ),
            VerticalPlaceholderView(20),
            playlist.tags.isEmpty
                ? Container()
                : Row(
                    children: <Widget>[
                      Text(
                        "标签: ",
                        style: common14WhiteTextStyle,
                      ),
                      Row(
                        children:
                            playlist.tags.map((tag) => TagWidget(tag)).toList(),
                      ),
                    ],
                  ),
            playlist.tags.isEmpty ? Container() : VerticalPlaceholderView(40),
            Text(
              playlist.description,
              style: common14WhiteTextStyle,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
