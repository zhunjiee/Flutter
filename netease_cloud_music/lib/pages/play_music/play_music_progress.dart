/**
 * @ClassName play_music_progress
 * @Description TODO
 * @Author houge
 * @Date 2020/3/9 12:44 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/common_text_style.dart';
import '../../provider/play_music_provider.dart';

class PlayMusicProgressWidget extends StatelessWidget {
  PlayMusicProgressWidget(this.provider);

  final PlayMusicProvider provider;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: provider.curPositionStream,
        builder: (context, snapshot){
      if (snapshot.hasData){
        var curTimeStr = snapshot.data.substring(0, snapshot.data.indexOf("-"));
        var totalTimeStr = snapshot.data.substring(snapshot.data.indexOf("-") + 1);
        return _progressView(curTimeStr, totalTimeStr);
      } else {
        return _progressView("0", "0");
      }
    });
  }

  Widget _progressView(String curTimeStr, String totalTimeStr) {
    return Container(
      height: ScreenUtil().setWidth(50),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
      child: Row(
        children: <Widget>[
          Text(
            DateUtil.formatDateMs(int.parse(curTimeStr), format : "mm:ss"),
            style: smallWhiteTextStyle,
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: ScreenUtil().setWidth(2), // 轨道高度
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: ScreenUtil().setWidth(10),
                ), // 滑块形状
              ),
              child: Slider(
                value: double.parse(curTimeStr), // 当前进度
                onChanged: (v) {
                  provider.sinkProgress(v.toInt());
                },
                onChangeStart: (v) {
                  provider.pausePlay();
                },
                onChangeEnd: (v) {
                  provider.seekPlay(v.toInt());
                },
                min: 0.0,
                max: double.parse(totalTimeStr),
                activeColor: Colors.white, // 已滑过部分颜色
                inactiveColor: Colors.white38, // 未滑过部分颜色
              ),
            ),
          ),
          Text(
            DateUtil.formatDateMs(int.parse(totalTimeStr), format : "mm:ss"),
            style: smallWhite30TextStyle,
          ),
        ],
      ),
    );
  }
}
