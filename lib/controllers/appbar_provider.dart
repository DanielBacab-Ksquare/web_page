import 'package:flutter/material.dart';

class AppbarProvider extends ChangeNotifier {
  bool isCollapsed = false;
  bool isExpanded = true;
  num currentHeight = 100;
  Color sliverAppBarColor = Color.fromRGBO(100, 100, 100, 1);
  int colorOffset = 0;

  void newColor(int a, int b, int c) {
    if (a < 0) a = 0;
    if (b < 0) b = 0;
    if (c < 0) c = 0;
    sliverAppBarColor = Color.fromRGBO(a, b, c, 1);

    notifyListeners();
  }
}
