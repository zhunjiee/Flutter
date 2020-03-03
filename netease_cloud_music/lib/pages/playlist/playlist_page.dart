/**
 * @ClassName play_list
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-26 11:04
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/playlist_model.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import '../../application.dart';
import '../play/play_widget.dart';
import 'playlist_app_bar.dart';
import '../../model/recommend_playlist_model.dart';
import '../../widgets/v_placeholder_view.dart';
import '../../widgets/h_placeholder_view.dart';
import '../../widgets/widget_playlist_cover.dart';
import '../../widgets/widget_circular_image.dart';
import '../../widgets/custom_sliver_future_builder.dart';
import '../../utils/common_text_style.dart';
import '../../widgets/widget_footer_tab.dart';

class PlaylistPage extends StatefulWidget {
  PlaylistPage(this.data);

  final Recommend data;

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  double _expandedHeight = ScreenUtil().setHeight(630);
  PlaylistModel _playlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(110) + Application.bottomBarHeight,
            ),
            child: CustomScrollView(
              slivers: <Widget>[
                _playlistInfo(),
                // 歌曲列表
                CustomSliverFutureBuilder<PlaylistModel>(
                  futureFunc: NetUtils().getPlaylistDetailData,
                  params: {"id": widget.data.id},
                  builder: (context, value) {
                    List<Tracks> trackList = value.playlist.tracks;
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ListTile(
                            title: Text(trackList[index].name),
                          );
                        },
                        childCount: trackList.length,
                      ),
                    );
                  },
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

  /// 歌单信息
  Widget _playlistInfo() {
    return PlaylistAppBar(
      content: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(35),
            top: ScreenUtil().setHeight(120),
            right: ScreenUtil().setWidth(35),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  // 左侧歌单封面
                  PlaylistCover(
                    "${widget.data.picUrl}?param=200y200",
                    width: 250,
                    playCount: widget.data.playCount,
                  ),
                  HorizontalPlaceholderView(20),
                  // 右侧歌单信息
                  _playlistRightInfo(),
                ],
              ),
              VerticalPlaceholderView(15),
              // 评论/分享/下载/多选
              _commentWidget(),
            ],
          ),
        ),
      ),
      expandedHeight: _expandedHeight,
      title: widget.data.name,
      backgroundImg: widget.data.picUrl,
      sigma: 20,
      playOnTap: (String zhanwei){
        print(zhanwei);
      },
    );
  }

  /// 歌单信息: 右侧歌单信息
  Widget _playlistRightInfo() {
    return Expanded(
      child: Column(
        children: <Widget>[
          // 标题
          Text(
            widget.data.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: mWhiteBoldTextStyle,
          ),
          VerticalPlaceholderView(10),
          // 创建者
          GestureDetector(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularImage(
                    "${widget.data.creator.avatarUrl}?param=50y50", 40),
                HorizontalPlaceholderView(5),
                Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    widget.data.creator.nickname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: commonWhite70TextStyle,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
          // 歌单描述
          GestureDetector(
            onTap: () {},
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.data.creator.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: smallWhite70TextStyle,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 评论/分享 等
  Widget _commentWidget() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          FooterTabItem("images/icon_comment.png", "评论",),
          FooterTabItem("images/icon_share.png", "分享",),
          FooterTabItem("images/icon_download.png", "下载",),
          FooterTabItem("images/icon_multi_select.png", "多选",),
        ],
      ),
    );
  }
}
