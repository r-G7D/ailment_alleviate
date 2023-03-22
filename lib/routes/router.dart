import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layers/presentation/pages/dashboard_screen.dart';
import '../layers/presentation/pages/auth/login_screen.dart';
import '../layers/presentation/pages/auth/register_screen.dart';
import '../layers/presentation/pages/emperis_screen.dart';
import '../layers/presentation/pages/home_screen.dart';
import '../layers/presentation/pages/maker/create/create_recipe_screen.dart';
import '../layers/presentation/pages/maker/create/create_ingredient_screen.dart';
import '../layers/presentation/pages/maker/maker_screen.dart';
import '../layers/presentation/pages/recipe_screen.dart';
import '../layers/presentation/pages/role_screen.dart';
import '../layers/presentation/pages/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => SplashScreen(),
      routes: [
        GoRoute(
          path: 'role',
          name: 'role',
          pageBuilder: (context, state) => mPage(
            const RoleScreen(),
          ),
        ),
        GoRoute(
          path: 'home',
          name: 'home',
          pageBuilder: (context, state) => mPage(
            const HomeScreen(),
          ),
        ),
        GoRoute(
          path: 'login',
          name: 'login',
          pageBuilder: (context, state) => mPage(
            const LoginScreen(),
          ),
        ),
        GoRoute(
          path: 'register',
          name: 'register',
          pageBuilder: (context, state) => mPage(
            const RegisterScreen(),
          ),
        ),
        GoRoute(
          path: 'emperis',
          name: 'emperis',
          pageBuilder: (context, state) => mPage(
            const EmperisScreen(),
          ),
        ),
        GoRoute(
          path: 'dashboard',
          name: 'dashboard',
          pageBuilder: (context, state) => mPage(
            const DashboardScreen(),
          ),
        ),
        GoRoute(
          path: 'recipe',
          name: 'recipe',
          pageBuilder: (context, state) => mPage(
            const RecipeScreen(),
          ),
        ),
        GoRoute(
          path: 'maker',
          name: 'maker',
          pageBuilder: (context, state) => mPage(
            const MakerScreen(),
          ),
        ),
        GoRoute(
          path: 'create-recipe',
          name: 'create-recipe',
          pageBuilder: (context, state) => mPage(
            const CreateRecipeScreen(),
          ),
        ),
        GoRoute(
          path: 'create-ingredient',
          name: 'create-ingredient',
          pageBuilder: (context, state) => mPage(
            const CreateIngredientScreen(),
          ),
        ),
      ],
    )
  ],
);

MaterialPage mPage(page) {
  return MaterialPage(
    child: page,
  );
}

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
