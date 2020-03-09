/**
 * @ClassName discover_top_mv
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-28 19:19
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/v_placeholder_view.dart';
import '../../widgets/custom_future_builder.dart';
import '../../utils/net_utils.dart';
import '../../model/mv_model.dart';
import '../../utils/utils.dart';
import '../../utils/common_text_style.dart';
import '../../widgets/widget_common_title.dart';

class DiscoverTopMv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 标题
        CommonTitleWidget(
          "新碟上架",
          top: 0,
        ),
        // 新碟列表
        CustomFutureBuilder<MvModel>(
          builder: (context, value) {
            List<MvData> mvData = value.data;
            return Container(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return _topMvItem(mvData, index);
                },
                separatorBuilder: (context, index) {
                  return VerticalPlaceholderView(ScreenUtil().setWidth(100));
                },
                itemCount: mvData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
              ),
            );
          },
          futureFunc: NetUtils().getTopMvData,
        ),
      ],
    );
  }

  Widget _topMvItem(List<MvData> mvData, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Utils.showNetImage("${mvData[index].cover}?param=350&197"),
        ),
        VerticalPlaceholderView(5),
        Text(
          mvData[index].name,
          style: commonTextStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        VerticalPlaceholderView(2),
        Text(
          mvData[index].artistName,
          style: smallGrayTextStyle,
        ),
      ],
    );
  }
}
