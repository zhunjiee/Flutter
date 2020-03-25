import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwechat/temp/contact_list_temp_data.dart';
import '../../widgets/widget_custom_app_bar.dart';
import '../../common/common_constant.dart';
import '../../model/contact_model.dart';
import 'contact_header_item.dart';
import 'contact_item.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  // 首字母索引列表
  final List<String> _letterList = CommonConstant.INDEX_LETTERS;
  // 头部固定4行(新的朋友/群聊/标签/公众号)
  List<ContactModel> _baseContactList = [];
  // 星标朋友
  List<ContactModel> _starFriendList = [];
  // 原始联系人
  List<ContactModel> _contactsList = [];

  // 组装好的联系人列表
  List<ContactModel> _compactContactList = [];

  // ------------------------ Life Cycle ------------------------

  @override
  void initState() {
    super.initState();

    /// 模拟数据
    List<ContactModel> tempData = ContactListTempData.mock();
    // 顶部固定分组
    _baseContactList.addAll([
      ContactModel(type: 1, url: "images/ic_new_friend.png", name: "新的朋友"),
      ContactModel(type: 1, url: "images/ic_group_chat.png", name: "群聊"),
      ContactModel(type: 1, url: "images/ic_tag.png", name: "标签"),
      ContactModel(type: 1, url: "images/ic_public_account.png", name: "公众号")
    ]);
    // 星标朋友
    _starFriendList.addAll(tempData);
    // 联系人
    _contactsList.addAll(tempData);
    _contactsList.addAll(tempData);

    // 组装好的联系人数组
    _compactContactList = _allContactList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    itemBuilder: (context, index) {
                      ContactModel model = _compactContactList[index];
                      if (model.type == 0) {
                        return ContactHeaderItem(model.name);
                      } else {
                        return ContactItem(
                            model.url == null ? "images/avatar.png" : model.url,
                            model.name);
                      }
                    },
                    itemCount: _compactContactList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ],
              ),
            ),
            // 右侧字母导航
            _buildIndexLetterView(),
          ],
        ),
      ),
    );
  }

  // ------------------------ Methods ------------------------

  /// 组装好的联系人列表
  List<ContactModel> _allContactList() {
    List<ContactModel> list = [];
    List<List<ContactModel>> tempList = _letterList
        .map((letter) => _letterWithContacts(letter))
        .toList(); // 二维数组
    // 变为一维数组
    tempList.forEach((o) {
      if (o.isNotEmpty) {
        list.addAll(o);
      }
    });
    print(list);
    return list;
  }

  /// 首字母 + 下面的联系人
  List<ContactModel> _letterWithContacts(String letter) {
    // ↑ ☆ 不进行创建
    if (letter == _letterList[0] || letter == _letterList[1]) return [];

    List<ContactModel> list = [];
    // 筛选出联系人数组里以传入字母开头的所有联系人
    _contactsList.forEach((contact) {
      if (contact.startLetter == letter) {
        list.add(contact);
      }
    });
    if (list.isNotEmpty) {
      list.insert(0, ContactModel(type: 0, name: letter));
    }
    return list;
  }

  // ------------------------ Widgets ------------------------

  /// 字符索引视图
  Positioned _buildIndexLetterView() {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      width: ScreenUtil().setWidth(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: CommonConstant.INDEX_LETTERS.map((letter) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(3)),
              child: Center(
                child: Text(
                  letter,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20), color: Colors.black87),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
