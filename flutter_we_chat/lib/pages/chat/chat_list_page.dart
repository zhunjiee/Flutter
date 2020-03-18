import 'package:flutter/material.dart';
import '../../temp/chat_list_temp_data.dart';
import '../../model/chat_model.dart';
import 'chat_list_item.dart';
import '../../common/common_const.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List<ChatModel> _chatListData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatListData = ChatListTempData.mock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            ChatModel model = _chatListData[index];
            return ChatListItem(
                model.avatar, model.name, model.lastMsg, model.time);
          },
          separatorBuilder: (context, index) {
            return Container(
              width: 0.5,
              color: Colors.grey,
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
