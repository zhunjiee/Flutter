/**
 * @ClassName chat_page
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/25 10:46 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../widgets/widget_circular_image.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("聊天界面"),
      ),
      body: Container(
        color: Colors.red,
        child: CircularImage("images/avatar.png", width: 100,),
      ),
    );
  }
}
