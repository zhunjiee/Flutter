/**
 * @ClassName play_music_progress
 * @Description TODO
 * @Author houge
 * @Date 2020/3/9 12:44 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/common_text_style.dart';

class PlayMusicProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(50),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
      child: Row(
        children: <Widget>[
          Text(
            "00:47",
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
                value: 0.5, // 当前进度
                onChanged: (v) {},
                onChangeStart: (v) {},
                onChangeEnd: (v) {},
                min: 0.0,
                max: 1.0,
                activeColor: Colors.white, // 已滑过部分颜色
                inactiveColor: Colors.white38, // 未滑过部分颜色
              ),
            ),
          ),
          Text(
            "03:47",
            style: smallWhite30TextStyle,
          ),
        ],
      ),
    );
  }
}
