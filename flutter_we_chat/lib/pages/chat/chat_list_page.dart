import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../../temp/chat_list_temp_data.dart';
import '../../model/chat_model.dart';
import 'chat_list_item.dart';
import '../../common/common_color.dart';
import '../../widgets/widget_search_bar.dart';
import '../search/search_page.dart';
import '../../widgets/widget_custom_app_bar.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  // 获取电池电量
  static const MethodChannel methodChannel = MethodChannel('samples.flutter.io/battery');

  List<ChatModel> _chatListData;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatListData = ChatListTempData.mock();

    // 获取电池电量
    methodChannel.invokeMethod('getBatteryLevel').then((v){
      print("电池电量: $v");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _body(),
    );
  }

  /// 搜索框 + 聊天列表
  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: navThemeColor,
            child:
                CustomSearchBar(inputOnTap: () => _jumpToSearchPage(context)),
          ),
          ListView.separated(
            itemBuilder: (context, index) {
              ChatModel model = _chatListData[index];
              return ChatListItem(
                  model.avatar, model.name, model.lastMsg, model.time);
            },
            separatorBuilder: (context, index) {
              return Container(
                height: ScreenUtil().setWidth(0.5),
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(150)),
                color: Colors.grey[400],
              );
            },
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }

  /// 跳转到搜索页面
  void _jumpToSearchPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchPage(),
      ),
    );
  }
}
