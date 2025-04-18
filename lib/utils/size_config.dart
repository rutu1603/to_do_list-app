import 'package:flutter/cupertino.dart';

class SizeConfig{
  static double screenHight=0.0;
  static double screenWidht=0.0;

  SizeConfig(propertionateHeight);

  static void init (BuildContext context){
    screenWidht=MediaQuery.of(context).size.width;
    screenHight=MediaQuery.of(context).size.width;
  }

  static double getProportionatinHeight (double inputHeight){
    return(inputHeight/812) *screenHight;
  }

  static double getProportionatinWidht (double inputWidth){
    return(inputWidth/375) *screenHight;
  }

}