import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/features/authentication/data/auth_repository.dart';
import 'package:to_do_app/utils/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../utils/appstyles.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Account Information',
              style: AppStyles.titleTextStyle.copyWith(fontSize: 20),
            ),
            const Icon(
              Icons.account_circle,
              color: Colors.green,
              size: 80,
            ),
            Text(user?.email ?? 'No Email'),
            Text(user?.uid ?? 'No UID'),
            SizedBox(height: SizeConfig.getProportionatinHeight(20)),
            InkWell(
              onTap: () {
                showDialog(context: context,
                    builder: (ctx)=>AlertDialog(
                      title: Text('Are you Sure?', style: AppStyles.normalTextStyle,),
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: 60,
                      ),
                      actions: [
                        ElevatedButton(onPressed: (){
                            context.pop();
                          },
                          child: Text('Cancel',
                          style: AppStyles.normalTextStyle,
                          ),
                        ),

                        ElevatedButton(onPressed: (){
                          context.pop();
                          ref.read(authRepositoryProvider).signOut();
                        },
                          child: Text('Log Out',
                            style: AppStyles.normalTextStyle,
                          ),
                        ),

                      ],

                ));
              },
              child: Container(
                alignment: Alignment.center,
                height: SizeConfig.getProportionatinHeight(50),
                width: SizeConfig.screenWidht * 0.8,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Log Out',
                  style: AppStyles.titleTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
