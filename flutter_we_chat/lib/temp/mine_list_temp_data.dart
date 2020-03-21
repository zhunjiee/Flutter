/**
 * @ClassName mine_list_temp_data
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/20 3:18 PM
 * @Version 1.0
 */

import '../model/mine_model.dart';

class MineListTempData {
  static List<MineModel> mock() {
    List<MineModel> _mineModels = [];
    _mineModels.add(MineModel(
      assets: "images/ic_wallet.png",
      title: "支付",
      isDownDivider: true,
    ));
    _mineModels.add(MineModel(
        assets: "images/ic_collections.png",
        title: "收藏",
        isDownDivider: false));
    _mineModels.add(MineModel(
      assets: "images/ic_album.png",
      title: "相册",
      isDownDivider: false,
    ));
    _mineModels.add(MineModel(
        assets: "images/ic_cards_wallet.png",
        title: "卡包",
        isDownDivider: false));
    _mineModels.add(MineModel(
      assets: "images/ic_emotions.png",
      title: "表情",
      isDownDivider: true,
    ));
    _mineModels.add(MineModel(
      assets: "images/ic_settings.png",
      title: "设置",
      rightText: "账号未保护",
      isDownDivider: false,
    ));
    return _mineModels;
  }
}
