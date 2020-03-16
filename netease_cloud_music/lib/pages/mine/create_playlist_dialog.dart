/**
 * @ClassName widget_create_playlist_dialog
 * @Description TODO
 * @Author houge
 * @Date 2020/3/16 11:00 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/common_text_style.dart';
import '../../utils/common_color.dart';
import '../../widgets/h_placeholder_view.dart';

typedef SubmitCallback = Function(String name, bool isPrivate);

class CreatePlaylistDialog extends StatefulWidget {
  CreatePlaylistDialog({@required this.submitCallback});

  final SubmitCallback submitCallback;

  @override
  _CreatePlaylistDialogState createState() => _CreatePlaylistDialogState();
}

class _CreatePlaylistDialogState extends State<CreatePlaylistDialog> {
  bool isPrivate;
  TextEditingController _editingController;
  bool emptyTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPrivate = false;
    emptyTitle = true;
    _editingController = TextEditingController();
    _editingController.addListener((){
      if (_editingController.text.isEmpty) {
        setState(() {
          emptyTitle = true;
        });
      } else {
        setState(() {
          emptyTitle = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("新建歌单", style: bold16TextStyle),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
      ),
      content: Theme(
        data: ThemeData(primaryColor: themeColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _editingController,
              decoration: InputDecoration(
                hintText: "请输入歌单标题", // 占位文字
                hintStyle: common14GrayTextStyle,
              ),
              style: common14TextStyle, // 文本样式
              maxLength: 40, // 最大输入字数
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: ScreenUtil().setWidth(40),
                  height: ScreenUtil().setWidth(40),
                  child: Checkbox(
                    activeColor: themeColor,
                    value: isPrivate,
                    onChanged: (v) {
                      setState(() {
                        isPrivate = v;
                      });
                    },
                    materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // 去除默认顶部间距
                  ),
                ),
                HorizontalPlaceholderView(4),
                Text(
                  "设置为隐私歌单",
                  style: common15GrayTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("取消"),
          textColor: themeColor,
        ),
        FlatButton(
          onPressed: emptyTitle == true ? null : (){
            widget.submitCallback(_editingController.text, isPrivate);
            Navigator.of(context).pop(true);  // 关闭对话框并返回true
          },
          child: Text("提交"),
          textColor: themeColor,
        ),
      ],
    );
  }
}
