import 'package:flutter/material.dart';

class ExpandableProvider extends ChangeNotifier {
  
  List sections = [
    [false, false, false],
    [0.0, 0.0, 0.0],
    [false, false, false,false],
    [612.0, 609.0, 0.0, 0.0],
    ];

  double currentSection1Offset = 0;
   double currentSection2Offset = 0;

  void calculate1() {
   
    currentSection1Offset =
        (sections[0][0] ? sections[1][0] : 0.0) +
            (sections[0][1] ? sections[1][1] : 0.0) +
            (sections[0][2] ? sections[1][2] : 0.0);

     currentSection2Offset =
        (sections[2][0] ? 612.0 : 0.0) +
            (sections[2][1] ? 609.0 : 0.0) +
            (sections[2][2] ? 1584.747 : 0.0)+
            (sections[2][3] ? 618.25 : 0.0);       

    notifyListeners();
  }
}
