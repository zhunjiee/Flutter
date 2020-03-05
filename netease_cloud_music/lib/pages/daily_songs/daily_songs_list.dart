/**
 * @ClassName daily_songs_list
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-05 14:04
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../model/daily_songs_model.dart';
import '../../widgets/widget_playlist_item.dart';
import '../../model/music_model.dart';
import '../../widgets/custom_sliver_future_builder.dart';
import '../../utils/net_utils.dart';

class DailySongsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomSliverFutureBuilder<DailySongsModel>(
      futureFunc: NetUtils().getTopListData,
      builder: (context, value) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var d = value.recommend[index];
              return PlaylistItem(
                MusicData(
                  mvId: d.mvid,
                  picUrl: d.album.picUrl,
                  songName: d.name,
                  artists:
                      "${d.artists.map((a) => a.name).toList().join('/')} - ${d.album.name}",
                ),
                onTap: () {},
              );
            },
            childCount: value.recommend.length,
          ),
        );
      },
    );
  }
}
