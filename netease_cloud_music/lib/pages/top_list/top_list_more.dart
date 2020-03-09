/**
 * @ClassName top_list_more
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-05 21:55
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/common_text_style.dart';
import '../../widgets/v_placeholder_view.dart';
import '../../widgets/widget_corner_radius_image.dart';
import '../../model/top_list_model.dart';
import '../../utils/navigator_utils.dart';
import '../../model/recommend_model.dart';

class MoreTopList extends StatelessWidget {
  MoreTopList(this.moreList);

  final List<TopList> moreList;

  @override
  Widget build(BuildContext context) {
    if (moreList.length != 0) {
      return Container(
        child: Wrap(
          spacing: 24,  // 主轴间距
          runSpacing: 30, // 纵轴间距
          children: moreList.map((topList) {
            return _moreTopListItem(context, topList);
          }).toList(),
        ),
      );
    } else {
      return Container();
    }
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

  Widget _moreTopListItem(BuildContext context, TopList top) {
    String picUrl = top.coverImgUrl;
    String updateTime = top.updateFrequency;
    String name = top.name;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _toPlayListPage(context, top);
      },
      child: Container(
        width: ScreenUtil().setWidth(200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: ScreenUtil().setWidth(200),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      "$picUrl?param=150y150",
                      width: ScreenUtil().setWidth(200),
                      height: ScreenUtil().setWidth(200),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        "images/ck.9.png",
                        width: ScreenUtil().setWidth(200),
                        height: ScreenUtil().setWidth(80),
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
              ),
            ),
            VerticalPlaceholderView(10),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: common13TextStyle,
            ),
            VerticalPlaceholderView(10),
          ],
        ),
      ),
    );
  }
}
