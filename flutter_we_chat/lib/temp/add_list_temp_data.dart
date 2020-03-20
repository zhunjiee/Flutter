/**
 * @ClassName add_list_temp_data
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/20 10:44 AM
 * @Version 1.0
 */

import '../model/add_model.dart';

class AddListTempData {
  static Map<String, dynamic> addListMap = {
    "addList": [
      {
        "icon": 0xe69e,
        "name": "发起群聊",
      },
      {
        "icon": 0xe638,
        "name": "添加朋友",
      },
      {
        "icon": 0xe61b,
        "name": "扫一扫",
      },
      {
        "icon": 0xe62a,
        "name": "收付款",
      },
      {
        "icon": 0xe63d,
        "name": "帮助与反馈",
      }
    ]
  };

  static AddListModel modelList = AddListModel.fromJson(addListMap);
}
