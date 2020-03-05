/**
 * @ClassName recommend_playlist
 * @Description 推荐歌单
 * @Author HouGe
 * @Date 2020-02-27 14:51
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/h_placeholder_view.dart';
import '../../widgets/custom_future_builder.dart';
import '../../utils/net_utils.dart';
import '../../model/recommend_playlist_model.dart';
import '../../widgets/widget_playlist.dart';
import '../../widgets/widget_common_title.dart';
import '../../utils/navigator_utils.dart';

class DiscoverRecommendPlaylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 标题
        CommonTitleWidget("推荐歌单", top: 0,),
        // 歌单列表
        CustomFutureBuilder<RecommendPlaylistModel>(
          builder: (context, data) {
            List<Recommend> recommendList = data.recommend;
            return Container(
              height: ScreenUtil().setHeight(300),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return PlaylistWidget(
                    title: recommendList[index].name,
                    url: recommendList[index].picUrl,
                    playCount: recommendList[index].playCount,
                    maxLines: 2,
                    onTap: () {
                      NavigatorUtils.goPlaylistDetailPage(context, recommendList[index]);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return HorizontalPlaceholderView(ScreenUtil().setWidth(30));
                },
                itemCount: recommendList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
              ),
            );
          },
          futureFunc: NetUtils().getRecommendPlaylist,
        ),
      ],
    );
  }
}
