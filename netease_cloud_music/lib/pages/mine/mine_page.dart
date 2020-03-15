/**
 * @ClassName mine
 * @Description 我的页面
 * @Author HouGe
 * @Date 2020-02-25 21:01
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../utils/common_text_style.dart';
import 'mine_playlist_title.dart';
import '../../widgets/widget_net_error.dart';
import '../../model/playlist_model.dart';
import '../../widgets/widget_corner_radius_image.dart';
import '../../provider/mine_playlist_provider.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  Map<String, String> topMenuData = {
    '本地音乐': 'images/icon_music.png',
    '最近播放': 'images/icon_late_play.png',
    '下载管理': 'images/icon_download_black.png',
    '我的电台': 'images/icon_broadcast.png',
    '我的收藏': 'images/icon_collect.png',
  };
  List<String> topMenuKeys;
  MinePlaylistProvider _provider;
  bool selfPlaylistOffstage = false;
  bool collectPlaylistOffstage = false;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topMenuKeys = topMenuData.keys.toList();
    // build完成后调用此方法,只会调用一次
//    WidgetsBinding.instance.addPostFrameCallback((callback) {
//      print("加载完成");
//      if (mounted) {
//        _provider = Provider.of<MinePlaylistProvider>(context);
//        _provider.getMinePlaylistData(context);
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildTopMenu(),
                Container(
                  height: ScreenUtil().setWidth(20),
                  color: Color(0xfff5f5f5),
                ),
                _realBuildPlaylist(),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            child: Center(
              child: NetErrorWidget(callback: () {
                setState(() {});
              }),
            ),
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      future: _getMinePlaylistData(context),
    );
  }

  Future _getMinePlaylistData(BuildContext context) async {
    await Provider.of<MinePlaylistProvider>(context).getMinePlaylistData();
    return "获取我的歌单完成";
  }

  /// 上半部分菜单
  Widget _buildTopMenu() {
    return ListView.separated(
      itemBuilder: (context, index) {
        var curKey = topMenuKeys[index];
        var curValue = topMenuData[curKey];
        return Container(
          height: ScreenUtil().setWidth(110),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(140),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      curValue,
                      width: ScreenUtil().setWidth(100),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    curKey,
                    style: commonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          height: ScreenUtil().setWidth(0.5),
          margin: EdgeInsets.only(left: ScreenUtil().setWidth(140)),
          color: Colors.grey,
        );
      },
      itemCount: topMenuData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  /// 歌单部分
  Widget _realBuildPlaylist() {
    List createList = Provider.of<MinePlaylistProvider>(context, listen: false)
        .selfCreatePlaylist;
    List collectList = Provider.of<MinePlaylistProvider>(context, listen: false)
        .collectPlaylist;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
      child: Column(
        children: <Widget>[
          MinePlaylistTile(
            "创建的歌单",
            createList.length,
            trailing: SizedBox(
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
            ),
            onSwitchTap: () {
              setState(() {
                selfPlaylistOffstage = !selfPlaylistOffstage;
              });
            },
            onMoreTap: () {},
          ),
          Offstage(
            offstage: selfPlaylistOffstage,
            child: _buildPlaylistItem(createList),
          ),
          MinePlaylistTile(
            "收藏的歌单",
            10,
            onSwitchTap: () {
              setState(() {
                collectPlaylistOffstage = !collectPlaylistOffstage;
              });
            },
            onMoreTap: () {},
          ),
          Offstage(
            offstage: collectPlaylistOffstage,
            child: _buildPlaylistItem(collectList),
          ),
        ],
      ),
    );
  }

  /// 歌单展开的列表部分
  Widget _buildPlaylistItem(List<Playlist> playlist) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Playlist model = playlist[index];
        return ListTile(
          title: Text(
            model.name,
          ),
          subtitle: Text(
            "${model.trackCount}首",
            style: smallGrayTextStyle,
          ),
          leading: CornerRadiusImage(
            "${model.coverImgUrl}?param=150y150",
            width: 110,
            height: 110,
            radius: ScreenUtil().setWidth(12),
          ),
          trailing: SizedBox(
            width: ScreenUtil().setWidth(50),
            height: ScreenUtil().setWidth(70),
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ),
        );
      },
      itemCount: playlist.length,
    );
  }
}
