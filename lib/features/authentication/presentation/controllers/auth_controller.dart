import 'dart:async';
import 'dart:ffi';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../../data/auth_repository.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController{
  @override
  FutureOr<void> build(){
    throw UnimplementedError();
  }

  Future<void>createUserWithRmailAndPassword({required String email,required String password})async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
            ()=>ref
                .read(authRepositoryProvider)
                .createUserWithEmailandPassword(email: email, password: password));
  }

  Future<void>signInWithEmailAndPassword({required String email,required String password})async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
            ()=>ref
                .read(authRepositoryProvider)
                .signInWithEmailAndPassword(email: email, password: password));
  }

  Future<void>signOut()async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
            ()=>ref
                .read(authRepositoryProvider)
                .signOut());
  }
}

