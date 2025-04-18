import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:to_do_app/routes/go_router_refresh_stream.dart';

import '../features/authentication/presentation/screens/register_screen.dart';
import '../features/authentication/presentation/screens/sign_in_screen.dart';
import '../features/task_managemnet/presentation/screens/main_screen.dart';

part 'routes.g.dart';
enum AppRoutes{
  main,
  signIn,
  register,
}
final firebaseAuthenticationProvider = Provider<FirebaseAuth>((ref) {
 return FirebaseAuth.instance;

} );

@riverpod
GoRouter goRouter (GoRouterRef ref){
  final firebaseAuth = ref.watch(firebaseAuthenticationProvider);
  return GoRouter(
      initialLocation: '/main',
      debugLogDiagnostics: true,
      redirect: (context, state) {
        final isLoggedIn = firebaseAuth.currentUser != null;
        if(isLoggedIn && state.uri.toString() == '/signIn' || isLoggedIn && state.uri.toString() == '/register' ){
          return '/main';
        }
        else if(!isLoggedIn && state.uri.toString().startsWith('/main') )
        {
          return '/signIn';
        }
       return null;
      },
      refreshListenable:GoRouterRefreshStream(firebaseAuth.authStateChanges()),


      routes: [
        GoRoute(path:'/main',name: AppRoutes.main.name,builder: (context,state)=>const MainScreen()),
        GoRoute(path:'/signIn',name: AppRoutes.signIn.name,builder: (context,state)=>const SignInScreen()),
        GoRoute(path:'/register',name: AppRoutes.register.name,builder: (context,state)=>const RegisterScreen()),
      ]
  );
}
