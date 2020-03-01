import 'dart:ui';

/**
 * @ClassName playlist_app_bar
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-29 23:49
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:netease_cloud_music/utils/utils.dart';
import 'playlist_header.dart';
import 'flexible_detail_bar.dart';

class PlaylistAppBar extends StatelessWidget {
  PlaylistAppBar({
    @required this.expandedHeight,
    @required this.title,
    @required this.content,
    @required this.backgroundImg,
    this.sigma = 5,
    this.playOnTap,
    this.count,
  });

  final double expandedHeight;
  final String title;
  final Widget content;
  final String backgroundImg;
  final double sigma;
  final PlayModelCallback playOnTap;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      flexibleSpace: FlexibleDetailBar(
        content: content,
        background: Stack(
          children: <Widget>[
            backgroundImg.startsWith("http")
                ? Utils.showNetImage(
                    "$backgroundImg?param=200y200",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    backgroundImg,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
            // 高斯模糊效果
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigma,
                sigmaY: sigma,
              ),
              child: Container(
                color: Colors.black38,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
      bottom: PlaylistHeader(
        count: count,
        onTap: playOnTap,
      ),
      centerTitle: true,
      expandedHeight: expandedHeight, // 合并的高度，默认是状态栏的高度加AppBar的高度
      pinned: true, // 标题栏是否固定
      elevation: 0, // 阴影(分割线)
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }
}
