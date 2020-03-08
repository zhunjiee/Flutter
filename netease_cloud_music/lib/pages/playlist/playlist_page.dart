/**
 * @ClassName play_list
 * @Description 歌单页面
 * @Author HouGe
 * @Date 2020-02-26 11:04
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/playlist_model.dart';
import 'package:netease_cloud_music/provider/play_music_provider.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import '../../application.dart';
import '../bottom_play/bottom_play_widget.dart';
import 'playlist_app_bar.dart';
import '../../model/recommend_model.dart';
import '../../widgets/v_placeholder_view.dart';
import '../../widgets/h_placeholder_view.dart';
import '../../widgets/widget_playlist_cover.dart';
import '../../widgets/widget_circular_image.dart';
import '../../utils/navigator_utils.dart';
import '../../utils/common_text_style.dart';
import '../../widgets/widget_footer_tab.dart';
import '../../widgets/widget_playlist_item.dart';
import '../../model/music_model.dart';
import '../../widgets/widget_net_error.dart';
import '../../utils/number_utils.dart';
import 'playlist_desc_dialog.dart';

class PlaylistPage extends StatefulWidget {
  PlaylistPage(this.data);

  final Recommend data;

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  double _expandedHeight = ScreenUtil().setHeight(630);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(110) + Application.bottomBarHeight,
            ),
            child: FutureBuilder<PlaylistModel>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  /// 加载完成...
                  Playlist playlist = snapshot.data.playlist;
                  List<Tracks> trackList = playlist.tracks;
                  return CustomScrollView(
                    slivers: <Widget>[
                      // 歌单信息
                      _playlistInfoView(playlist: playlist),
                      // 歌曲列表
                      _musicList(trackList),
                    ],
                  );
                } else if (snapshot.hasError) {
                  /// 错误...
                  return CustomScrollView(
                    slivers: <Widget>[
                      _playlistInfoView(),
                      SliverToBoxAdapter(
                        child: NetErrorWidget(
                          callback: () {
                            // 重新请求数据
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  /// 加载中...
                  return CustomScrollView(
                    slivers: <Widget>[
                      _playlistInfoView(),
                      SliverToBoxAdapter(
                        child: Container(
                          alignment: Alignment.center,
                          height: ScreenUtil().setWidth(400),
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                    ],
                  );
                }
              },
              future: NetUtils().getPlaylistDetailData(
                context,
                params: {"id": widget.data.id},
              ),
            ),
          ),
          // 底部播放栏
          BottomPlayWidget(),
        ],
      ),
    );
  }

  /// 播放音乐
  void _playMusic() {
    NavigatorUtils.goPlayMusicPage(context);
  }

  // --------------- Widgets --------------------

  /// 歌单信息
  Widget _playlistInfoView({Playlist playlist}) {
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
                  _playlistRightInfoView(playlist),
                ],
              ),
              VerticalPlaceholderView(15),
              // 评论/分享/下载/多选
              _commentWidget(playlist),
            ],
          ),
        ),
      ),
      expandedHeight: _expandedHeight,
      title: widget.data.name,
      backgroundImg: widget.data.picUrl,
      count: playlist == null ? null : playlist.trackCount,
      sigma: 20,
      playOnTap: () {
        // 播放全部
      },
    );
  }

  /// 歌单信息: 右侧歌单信息
  Widget _playlistRightInfoView(Playlist playlist) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: playlist == null
                ? Container(
                    height: ScreenUtil().setHeight(40),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularImage(
                          "${playlist.creator.avatarUrl}?param=50y50", 40),
                      HorizontalPlaceholderView(5),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          playlist.creator.nickname,
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
            onTap: () {
              // 弹出歌单详情对话框
//              showDialog(
//                context: context,
//                builder: (context){
//                  return PlaylistDescDialog(playlist);
//                }
//              );
            // 自定义弹出对话框
              _showCustomDialog(playlist);
            },
            child: playlist == null
                ? Container(
                    height: ScreenUtil().setHeight(70),
                  )
                : Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          playlist.description,
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

  /// 弹出歌单详情
  _showCustomDialog(Playlist playlist) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return PlaylistDescDialog(playlist);
      },
      barrierDismissible: true, // 点击遮罩对话框消失
      barrierLabel:
      MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: Duration(milliseconds: 100),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  /// 自定义Dialog动画效果
  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }

  /// 评论/分享 等
  Widget _commentWidget(Playlist playlist) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          FooterTabItem(
            "images/icon_comment.png",
            playlist == null
                ? "评论"
                : NumberUtils.amountConversion(playlist.commentCount),
          ),
          FooterTabItem(
            "images/icon_share.png",
            playlist == null
                ? "分享"
                : NumberUtils.amountConversion(playlist.shareCount),
          ),
          FooterTabItem(
            "images/icon_download.png",
            "下载",
          ),
          FooterTabItem(
            "images/icon_multi_select.png",
            "多选",
          ),
        ],
      ),
    );
  }

  /// 歌单音乐
  Widget _musicList(List<Tracks> trackList) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          Tracks track = trackList[index];
          return PlaylistItem(
            MusicData(
                mvId: track.mv,
                index: index + 1,
                name: track.name,
                artists:
                    "${track.ar.map((a) => a.name).toList().join("/")} - ${track.al.name}"),
            onTap: () {
              // 播放音乐
              _playMusic();
            },
          );
        },
        childCount: trackList.length,
      ),
    );
  }
}
