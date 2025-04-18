import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/appstyles.dart';
import '../../../../utils/size_config.dart';

class  TitleDescription extends StatelessWidget{
  const TitleDescription({super.key, required this.title, required this.prefixIcon, required this.hintText, required this.controller, required int maxLines});

  final String title;
  final IconData prefixIcon;
  final String hintText;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context){
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.headingTextStyle.copyWith(
              fontSize:18,),
        ),
        SizedBox(height: SizeConfig.getProportionatinWidht(10) ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            hintText: hintText,
            filled: true,
            fillColor: Colors.grey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

}