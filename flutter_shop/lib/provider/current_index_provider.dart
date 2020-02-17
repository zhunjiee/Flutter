/**
 * @ClassName current_index_provider
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-17 17:34
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class CurrentIndexProvider with ChangeNotifier {
  int currentIndex = 0;

  changeIndex(int newIndex) {
    currentIndex = newIndex;

    notifyListeners();
  }
}