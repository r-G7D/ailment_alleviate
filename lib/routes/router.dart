import 'package:ailment_alleviate/layers/presentation/pages/dashboard_screen.dart';
import 'package:ailment_alleviate/layers/presentation/pages/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../layers/presentation/pages/emperis_screen.dart';
import '../layers/presentation/pages/login_screen.dart';
import '../layers/presentation/pages/recipe_screen.dart';
import '../layers/presentation/pages/register_screen.dart';
import '../layers/presentation/pages/splash_screen.dart';


final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => LoginScreen(),
      routes: [
        GoRoute(
          path: 'home',
          name: 'home',
          pageBuilder: (context, state) => slideTransitionRL(
            const HomeScreen(),
          ),
        ),
        GoRoute(
          path: 'login',
          name: 'login',
          pageBuilder: (context, state) => slideTransitionRL(
            const LoginScreen(),
          ),
        ),
        GoRoute(
          path: 'register',
          name: 'register',
          pageBuilder: (context, state) => slideTransitionRL(
            const RegisterScreen(),
          ),
        ),
        GoRoute(
          path: 'emperis',
          name: 'emperis',
          pageBuilder: (context, state) => slideTransitionRL(
            const EmperisScreen(),
          ),
        ),
        GoRoute(
          path: 'dashboard',
          name: 'dashboard',
          pageBuilder: (context, state) => slideTransitionRL(
            const DashboardScreen(),
          ),
        ),
        GoRoute(
          path: 'recipe',
          name: 'recipe',
          pageBuilder: (context, state) => slideTransitionRL(
            const RecipeScreen(),
          ),
        ),
      ],
    )
  ],
);

CustomTransitionPage<dynamic> slideTransitionRL(page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

CustomTransitionPage<dynamic> slideTransitionBT(page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
