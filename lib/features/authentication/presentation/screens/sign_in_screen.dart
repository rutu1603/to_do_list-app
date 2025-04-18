import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/common_wedgets/async_value_ui.dart';
import 'package:to_do_app/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:to_do_app/features/authentication/presentation/widgets/comman_text_field.dart';
import 'package:to_do_app/utils/appstyles.dart';
import 'package:to_do_app/utils/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../routes/routes.dart';


class SignInScreen extends ConsumerStatefulWidget{
  const SignInScreen({super.key});

  @override
  ConsumerState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {

  final _emailEditiongController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isChecked = false;


  void _validateDetails(){
    String email = _emailEditiongController.text.trim();
    String password = _passwordController.text.trim();

    if(email.isEmpty || password.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields',
            style: AppStyles.normalTextStyle.copyWith(
                color:Colors.red)),
          backgroundColor: Colors.white,
        ),
      );
    }else{
      ref.read(authControllerProvider.notifier).signInWithEmailAndPassword(email:email, password:password);
    }
  }

  @override
  void dispose() {
    _emailEditiongController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context) {
      SizeConfig.init(context);
      final state = ref.watch(authControllerProvider);

      ref.listen<AsyncValue>(authControllerProvider, (_, state) {
        state.showAlterDialogOnError(context);

      });


      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.fromLTRB(
              SizeConfig.getProportionatinWidht(10),
              SizeConfig.getProportionatinHeight(50),
              SizeConfig.getProportionatinWidht(10), 0,
            ),

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Sign In to your account',
                      style: AppStyles.titleTextStyle,
                    ),
                    SizedBox(height: SizeConfig.getProportionatinHeight(25),),
                    CommonTextField(
                      hintText: 'Enter Email',
                      textInputType: TextInputType.emailAddress,
                      controller: _emailEditiongController,
                    ),

                    SizedBox(height: SizeConfig.getProportionatinHeight(15),),
                    CommonTextField(
                      hintText: 'Enter password....',
                      textInputType: TextInputType.text,
                      obscureText: true,
                      controller: _passwordController,
                    ),

                    SizedBox(height: SizeConfig.getProportionatinHeight(10),),
                    Row(children: [
                      Checkbox(value: isChecked, onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                      Text(
                          'I agree with terms',
                          style: AppStyles.normalTextStyle
                      ),
                    ]),

                    SizedBox(height: SizeConfig.getProportionatinHeight(25),),
                    InkWell(
                      onTap:  _validateDetails,
                      child: Container(
                        alignment: Alignment.center,
                        height: SizeConfig.getProportionatinHeight(50),
                        width: SizeConfig.screenWidht,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),

                        child: state.isLoading? const CircularProgressIndicator(color: Colors.white,) : Text(
                          'Sign In',
                          style: AppStyles.normalTextStyle.copyWith(
                            color: Colors.white,),
                        ),
                      ),

                    ),

                    SizedBox(height: SizeConfig.getProportionatinHeight(10),),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: SizeConfig.getProportionatinHeight(1),
                            width: SizeConfig.screenWidht * 0.4,
                            decoration: BoxDecoration(color:Colors.grey),
                          ),
                          SizedBox(height: SizeConfig.getProportionatinHeight(10),),
                          Text('OR',style: AppStyles.normalTextStyle),
                          SizedBox(height: SizeConfig.getProportionatinWidht(5)),
                          Container(
                            height: SizeConfig.getProportionatinHeight(1),
                            width: SizeConfig.screenWidht * 0.4,
                            decoration: BoxDecoration(color:Colors.grey),
                          ),
                        ]),

                    SizedBox(height: SizeConfig.getProportionatinHeight(10),),
                    Row(
                      children: [
                        Container(
                          height: SizeConfig.getProportionatinHeight(80),
                          width: SizeConfig.screenWidht * 0.25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          )
                        ),
                        Container(
                            height: SizeConfig.getProportionatinHeight(80),
                            width: SizeConfig.screenWidht * 0.25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                            )
                        ),
                        Container(
                            height: SizeConfig.getProportionatinHeight(80),
                            width: SizeConfig.screenWidht * 0.25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.apple,
                              color: Colors.black,
                            )
                        ),
                      ],
                ),
                    SizedBox(height: SizeConfig.getProportionatinHeight(10),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Don\'t have an account?',
                            style: AppStyles.normalTextStyle
                        ),

                        GestureDetector(
                          onTap: (){
                            context.goNamed(AppRoutes.register.name);
                          },
                            child:  Text(
                                'Register',
                                style: AppStyles.normalTextStyle.copyWith(color:Colors.green)
                            ),
                        ),
                      ]),

                    ])    ,
                    ),
          ),
        ),
      );
    }
  }

