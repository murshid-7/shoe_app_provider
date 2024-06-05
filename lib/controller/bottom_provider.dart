import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int currentIndex = 0;
  void changeBottomBar(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
