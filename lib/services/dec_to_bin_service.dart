import 'dart:developer';
import 'dart:math' as m;

import 'package:get/get.dart';
import 'package:getxlearn/models/my_list_model.dart';
class DecToBinController extends GetxController{

  Rx<String> binaryNo = Rx<String>("");
  String getHexValue(String x)
  {
    switch(x){
      case "0":
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9": return x;
      case "10":return "A";
      case "11":return "B";
      case "12":return "C";
      case "13":return "D";
      case "14":return "E";
      case "15":return "F";
      default:return "";

    }

  }

  decTo(String dec,int base)
  {


    int d = int.parse(dec);
    String b="";
    while(d!=0)
    {
      String rem =(d%base).toString();
      b += getHexValue(rem);
      d = d~/base;
    }
    b= b.split('').reversed.join();
    log(b);
    binaryNo.value = b;
    update();

  }

  binTo(String dec,int base)
  {
    int getV(String pattern)
    {
      int v=0;
      for (int i = 0; i < pattern.length; i++) {
        if (pattern[i] == "1") {
          v += m.pow(base, i) as int;
        }
      }
    return v;
      return 0;
    }

    int d = int.parse(dec);
    int b=0;
    int ind = 0;
    dec= dec.split('').reversed.join();
    if(base == 2){
      for (int i = 0; i < dec.length; i++) {
        if (dec[i] == "1") {
          b += m.pow(2, i) as int;
        }
      }
    } else{
      while(ind<dec.length)
        {
          String pattern = dec.substring(ind,dec.length>=ind?base:dec.length);
          ind +=base;
          log(ind.toString());
          b += getV(pattern);
          // log(b.toString());

        }
    }

    log(b.toString());
    binaryNo.value = b.toString();
    update();

  }


}