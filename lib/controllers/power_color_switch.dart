import 'package:flutter/material.dart';

class PowerColorSwitch {
  setColorForPower(String power) {
    Color bgColor;
    switch (power) {
      case 'clairvoyance':
        bgColor = const Color.fromRGBO(123, 0, 8, 1);
        return bgColor;
      case 'confusion':
        bgColor = const Color.fromRGBO(88, 142, 5, 1);
        return bgColor;
      case 'herbaphony':
        bgColor = const Color.fromRGBO(0, 255, 0, 1);
        return bgColor;
      case 'hydrokinesis':
        bgColor = const Color.fromRGBO(141, 176, 236, 1);
        return bgColor;        
      case 'invisibility':
        bgColor = const Color.fromRGBO(21, 239, 210, 1);
        return bgColor;        
      case 'levitation':
        bgColor = const Color.fromRGBO(27, 65, 157, 1);
        return bgColor;        
      case 'marksmanship':
        bgColor = const Color.fromRGBO(222, 71, 33, 1);
        return bgColor;        
      case'psi-punch':
        bgColor = const Color.fromRGBO(255, 220, 53, 1);
        return bgColor;        
      case 'pyrokinesis':
        bgColor = const Color.fromRGBO(202, 69, 0, 1);
        return bgColor;        
      case 'telekinesis':
        bgColor = const Color.fromRGBO(156, 105, 0, 1);
        return bgColor;
      case 'shield':
        bgColor = const Color.fromRGBO(53, 0, 107, 1);
        return bgColor;        
      default:
        break;
    }
  }
}