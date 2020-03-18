import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("通讯录"),
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
        child: Center(
          child: Text("通讯录"),
        ),
      ),
    );
  }
}
