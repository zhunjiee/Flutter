/**
 * @ClassName top_list_offical
 * @Description 排行榜 - 官方榜
 * @Author HouGe
 * @Date 2020-03-05 20:12
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/v_placeholder_view.dart';
import '../../widgets/h_placeholder_view.dart';
import '../../widgets/widget_corner_radius_image.dart';
import '../../model/top_list_model.dart';
import '../../utils/common_text_style.dart';
import '../../utils/navigator_utils.dart';
import '../../model/recommend_playlist_model.dart';

class OfficialTopList extends StatelessWidget {
  OfficialTopList(this.officialList);

  final List<TopList> officialList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(20),
      ),
      itemBuilder: (context, index) {
        return _officialTopItem(context, index);
      },
      itemCount: officialList.length,
      separatorBuilder: (context, index) {
        return VerticalPlaceholderView(30);
      },
    );
  }

  /// 跳转到歌单详情页
  void _toPlayListPage(BuildContext context, TopList data) {
    NavigatorUtils.goPlaylistDetailPage(
        context,
        Recommend(
          picUrl: data.coverImgUrl,
          name: data.name,
          playCount: data.playCount,
          id: data.id,
        ));
  }

  /// 单个item组件
  Widget _officialTopItem(BuildContext context, int index) {
    var i = 1;
    String picUrl = officialList[index].coverImgUrl;
    String updateTime = officialList[index].updateFrequency;
    List<Tracks> tracks = officialList[index].tracks;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _toPlayListPage(context, officialList[index]);
      },
      child: Container(
        height: ScreenUtil().setHeight(200),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                CornerRadiusImage("$picUrl?param=150y150",
                    width: 200, height: 200, radius: 10),
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    "images/ck.9.png",
                    width: ScreenUtil().setWidth(200),
                    height: ScreenUtil().setHeight(80),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: ScreenUtil().setWidth(10),
                  bottom: ScreenUtil().setWidth(10),
                  child: Text(
                    updateTime,
                    style: smallWhiteTextStyle,
                  ),
                ),
              ],
            ),
            HorizontalPlaceholderView(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: tracks.map((track) {
                  return Container(
                    height: ScreenUtil().setHeight(65),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${i++}. ${track.first} - ${track.second}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: common13TextStyle,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
