import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/utils/appstyles.dart';

class CommonTextField extends StatelessWidget{
  const CommonTextField(
      {super.key,
        required this.hintText,
        required this.textInputType,
        this.obscureText,
        required this.controller});

  final String hintText;
  final TextInputType textInputType;
  final bool? obscureText;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context){
    return TextField(
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:AppStyles.normalTextStyle,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1,),
    ),
    focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.green,
            width: 1,),
      ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10)
    ),
    );
  }
}