/**
 * @ClassName daily_songs_list
 * @Description 每日歌单 - 歌曲列表
 * @Author HouGe
 * @Date 2020-03-05 14:04
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/daily_songs_model.dart';
import '../../widgets/widget_playlist_item.dart';
import '../../model/music_model.dart';
import '../../utils/navigator_utils.dart';
import '../../provider/play_music_provider.dart';

typedef PlaySongIndexCallback = void Function(int index);

class DailySongsList extends StatelessWidget {
  DailySongsList(this.songsList, {this.onTap});

  final List<Recommend> songsList;
  final PlaySongIndexCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          Recommend d = songsList[index];
          return PlaylistItem(
            MusicData(
              mvId: d.mvid,
              picUrl: d.album.picUrl,
              name: d.name,
              artists:
                  "${d.artists.map((a) => a.name).toList().join('/')} - ${d.album.name}",
            ),
            onTap: (){
              onTap(index);
            },
          );
        },
        childCount: songsList.length,
      ),
    );
  }

  /// 播放歌曲
  void playSongs(BuildContext context, List<Recommend> recommendList, int index) {
    // 组装音乐模型
    List<MusicData> musicList = recommendList
        .map(
          (d) => MusicData(
            id: d.id,
            name: d.name,
            picUrl: d.album.picUrl,
            artists: "${d.artists.map((a) => a.name).toList().join('/')}",
          ),
        )
        .toList();
    // Provider
    Provider.of<PlayMusicProvider>(context, listen: false)
        .playAllSongs(musicList, index: index);
    // 跳转到播放界面
    NavigatorUtils.goPlayMusicPage(context);
  }
}
