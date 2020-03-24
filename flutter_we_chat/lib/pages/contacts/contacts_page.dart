import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwechat/temp/contact_list_temp_data.dart';
import '../../widgets/widget_custom_app_bar.dart';
import '../../common/common_constant.dart';
import '../../model/contact_model.dart';
import '../../common/common_color.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  // 头部固定4行(新的朋友/群聊/标签/公众号)
  List<ContactModel> _baseContactList = [];
  // 星标朋友
  List<ContactModel> _starFriendList = [];
  // 联系人
  List<ContactModel> _contactsList = [];


  // ------------------------ Life Cycle ------------------------

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// 模拟数据
    List<ContactModel> tempData = ContactListTempData.mock();
    _baseContactList.addAll([
      ContactModel(type: 0, url: "images/ic_new_friend.png", name: "新的朋友"),
      ContactModel(type: 0, url: "images/ic_group_chat.png", name: "群聊"),
      ContactModel(type: 0, url: "images/ic_tag.png", name: "标签"),
      ContactModel(type: 0, url: "images/ic_public_account.png", name: "公众号")
    ]);
    _starFriendList.addAll(tempData);

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
                  _buildGroupHeaderItem("haha"),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("第$index行"),
                      );
                    },
                    itemCount: 50,
                    itemExtent: 60,
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


  // ------------------------ Widgets ------------------------

  /// 联系人列表单个 item
  Widget _buildContactItem() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(),
          Divider(),
        ],
      ),
    );
  }

  /// 每个分组的头部 item
  Widget _buildGroupHeaderItem(String title) {
    return Container(
      height: 30,
//      width: double.infinity,
      padding: EdgeInsets.only(left: 10),
      color: navThemeColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey[600]),),
        ],
      ),
    );
  }

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
                  style: TextStyle(fontSize: ScreenUtil().setSp(20), color: Colors.black87),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
