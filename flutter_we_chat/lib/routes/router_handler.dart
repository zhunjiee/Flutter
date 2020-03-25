/**
 * @ClassName router_handler
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/25 10:53 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/chat/chat_page.dart';

Handler chatHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ChatPage();
  }
);
