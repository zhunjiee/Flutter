import 'package:flutter/material.dart';
import '../../widgets/widget_custom_app_bar.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: _buildDiscoverListTile("images/ic_social_circle.png"),
      ),
    );
  }

  Widget _buildDiscoverListTile(String src,){
    return Container(
      height: 50,

      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            child: Image.asset(src,width: 28, height: 28,),
          ),
          Expanded(child: Text("haha")),
          Container(
            width: 30,
            child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15,),
          ),
        ],
      ),
    );
  }
}
