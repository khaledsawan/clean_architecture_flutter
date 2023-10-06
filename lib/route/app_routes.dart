import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/url/app_api_url.dart';
import '../di.dart';
import '../features/Login/presentation/page/LoginPage.dart';
import '../features/courses_list/presentation/pages/home_screen.dart';
import '../features/signup/presentation/page/sign_up_page.dart';

class AppRoutes {
  static const home = 'home';
  static const loginPage = 'loginPage';
  static const signUpPage = 'signupPage';

  static animatedPage(
      BuildContext context, GoRouterState state, Widget widget) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: GlobalKey<NavigatorState>(),
    errorBuilder: (BuildContext context, GoRouterState state) {
      return LoginPage();
    },
    routes: [
      GoRoute(
        name: home,
        path: '/',
        builder: (context, state) => HomeScreen(),
        pageBuilder: (context, state) {
          return animatedPage(context, state, HomeScreen());
        },
      ),
      GoRoute(
        name: loginPage,
        path: '/login',
        pageBuilder: (context, state) {
          return animatedPage(context, state, LoginPage());
        },
      ),
      GoRoute(
        name: signUpPage,
        path: '/signUp',
        pageBuilder: (context, state) {
          return animatedPage(context, state, SignUpPage());
        },
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      // TODO: Implement error handling "need to change"
      final SharedPreferences sharedPreferences = getIt();
      final isAuthenticated = sharedPreferences.containsKey(AppApiUrl.TOKEN);
      print("isAuthenticated:" + isAuthenticated.toString());
      if (!isAuthenticated) {
        return '/loginPage';
      } else {
        return null;
      }
    },
  );
}
