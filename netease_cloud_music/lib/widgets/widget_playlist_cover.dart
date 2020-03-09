/**
 * @ClassName widget_playlist_cover
 * @Description 歌单/新碟上架等封面组件
 * @Author HouGe
 * @Date 2020-02-27 20:28
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/utils.dart';
import '../utils/number_utils.dart';

class PlaylistCover extends StatelessWidget {
  PlaylistCover(
    this.url, {
    this.playCount,
    this.width = 200,
    this.height,
    this.radius = 16,
  });

  final String url;
  final int playCount;
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(radius)),
      child: Container(
        width: ScreenUtil().setWidth(width),
        height: ScreenUtil().setWidth(height ?? width),
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            _coverImage(),  // 封面图片
            playCount == null ? Container() : _playCountWidget(), // 右上角播放量
          ],
        ),
      ),
    );
  }

  /// 封面图片
  Widget _coverImage() {
    return Utils.showNetImage(
      "$url?param=200y200",
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(height ?? width),
      fit: BoxFit.cover,
    );
  }

  /// 右上角播放量
  Widget _playCountWidget() {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setWidth(2),
        right: ScreenUtil().setWidth(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset(
            "images/icon_triangle.png",
            width: ScreenUtil().setWidth(30),
            height: ScreenUtil().setWidth(30),
          ),
          Text(
            "${NumberUtils.amountConversion(playCount)}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
