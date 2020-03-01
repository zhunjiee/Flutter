/**
 * @ClassName play_list
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-26 11:04
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../application.dart';
import '../play/play_widget.dart';
import 'playlist_app_bar.dart';
import '../../model/recommend_playlist_model.dart';

class PlaylistPage extends StatelessWidget {
  PlaylistPage(this.data);

  final Recommend data;


  double _expandedHeight = ScreenUtil().setHeight(630);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                bottom:
                    ScreenUtil().setHeight(110) + Application.bottomBarHeight),
            child: CustomScrollView(
              slivers: <Widget>[
                PlaylistAppBar(
                    expandedHeight: _expandedHeight,
                    title: null,
                    content: null,
                    backgroundImg: null
                ),
              ],
            ),
          ),
          // 底部播放栏
          BottomPlayWidget(),
        ],
      ),
    );
  }
}
