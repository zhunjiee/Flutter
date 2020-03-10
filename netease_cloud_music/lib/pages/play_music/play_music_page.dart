/**
 * @ClassName play_songs_page
 * @Description 音乐播放界面
 * @Author houge
 * @Date 2020/3/8 11:00 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/pages/play_music/play_music_gramophone.dart';
import 'package:provider/provider.dart';
import '../../application.dart';
import '../../widgets/v_placeholder_view.dart';
import 'play_music_navigate_bar.dart';
import 'play_music_option.dart';
import 'play_music_progress.dart';
import 'play_music_bottom_menu.dart';
import '../../provider/play_music_provider.dart';

class PlayMusicPage extends StatefulWidget {
  @override
  _PlayMusicPageState createState() => _PlayMusicPageState();
}

class _PlayMusicPageState extends State<PlayMusicPage> {
  bool play = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PlayMusicProvider>(builder: (context, provider, child) {
        return Stack(
          children: <Widget>[
            // 导航栏+模糊背景
            PlayMusicNavigateBar(
              provider.song.name,
              provider.song.artists,
              provider.song.picUrl,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: kToolbarHeight + Application.statusBarHeight),
              child: Column(
                children: <Widget>[
                  // 唱片机
                  PlayMusicGramophone(
                    provider.playState,
                    provider.song.picUrl,
                  ),
                  // 歌曲相关操作
                  PlayMusicOptionWidget(),
                  // 进度条
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(20)),
                    child: PlayMusicProgressWidget(),
                  ),
                  // 底部暂停等按钮
                  PlayMusicBottomMenu(provider),
                  VerticalPlaceholderView(20),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
