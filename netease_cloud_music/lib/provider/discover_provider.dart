/**
 * @ClassName discover_provider
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-26 15:50
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../utils/net_utils.dart';
import '../model/banner_model.dart';

class DiscoverProvider with ChangeNotifier {
  List<BannerInfo> bannerList = [];

}