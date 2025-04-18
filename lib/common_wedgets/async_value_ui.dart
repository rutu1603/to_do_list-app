import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/utiles/appstyles.dart';
import 'package:to_do_app/utils/appstyles.dart';

extension AsyncValueUi on AsyncValue{
  void showAlterDialogOnError(BuildContext context){
    if(!isLoading && hasError){
      final message = _errorMessage(error);
      showDialog(
          context:context,
          builder:(context)=> AlertDialog(
            icon:const Icon(
              Icons.error,
              color:Colors.red,
              size:40,
            ),
            title:Text(
              message,
              style: AppStyles.normalTextStyle,),
            actions:[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child:Text(
                        'Close',
                        style: AppStyles.normalTextStyle,
                      ),
                  ),
                ],
              )
            ],
          ),
      );
    }
  }
}

String _errorMessage(Object? error) {
  if (error is FirebaseAuthException) {
    return error.message ?? error.toString();
  }
  return error.toString(); // fallback for other types of errors
}
