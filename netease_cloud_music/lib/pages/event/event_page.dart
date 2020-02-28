/**
 * @ClassName event_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-25 21:02
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    print("动态");
    return Container(
      child: Center(
        child: Text("动态"),
      ),
    );
  }
}
