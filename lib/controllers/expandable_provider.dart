import 'package:flutter/material.dart';

class ExpandableProvider extends ChangeNotifier {
  
  //Los vectores indican cuales elementos estan expandidos o no
  List sections = [
    //Seccion 0 es la seccion de experience
    [false, false, false,false],
    [0.0, 0.0, 0.0,0.0],
    //Esta seccion seria la 2 en indice, pero se refiere a la de Projects
    [false, false, false,false],
    [0.0, 0.0, 0.0, 0.0],
    ];

  double currentSection1Offset = 0;
   double currentSection2Offset = 0;

  void calculate1() {
   
    currentSection1Offset =
        (sections[0][0] ? sections[1][0] : 0.0) +
            (sections[0][1] ? sections[1][1] : 0.0) +
            (sections[0][2] ? sections[1][2] : 0.0) +
            (sections[0][3] ? sections[1][3] : 0.0);

      //Estos valores de 612.0 y 609.0 son solo para pc, para mobil queda grande. Esto queda pendienteq
     currentSection2Offset =
        (sections[2][0] ? 612.0 : 0.0) +
            (sections[2][1] ? 609.0 : 0.0) +
            (sections[2][2] ? sections[3][2] : 0.0)+
            (sections[2][3] ? sections[3][3] : 0.0);       

    notifyListeners();
  }
}
