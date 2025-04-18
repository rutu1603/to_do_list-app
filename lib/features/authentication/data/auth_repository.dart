import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._auth);

  final FirebaseAuth _auth;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  User? get currentUser => _auth.currentUser;

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(FirebaseAuth.instance);}


@Riverpod(keepAlive: true)
Stream<User?>authStateChanges(AuthStateChangesRef ref){
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
}

@Riverpod(keepAlive: true)
User? currentUser (CurrentUserRef ref){
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.currentUser;
}



