import 'package:flutter/material.dart';
import '../../widgets/widget_custom_app_bar.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: Center(
          child: Text("通讯录"),
        ),
      ),
    );
  }
}
