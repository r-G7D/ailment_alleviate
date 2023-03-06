import 'package:ailment_alleviate/layers/presentation/pages/maker/add_ingredient_screen.dart';
import 'package:ailment_alleviate/layers/presentation/pages/maker/add_med_screen.dart';
import 'package:ailment_alleviate/layers/presentation/pages/dashboard_screen.dart';
import 'package:ailment_alleviate/layers/presentation/pages/home_screen.dart';
import 'package:ailment_alleviate/layers/presentation/pages/maker/maker_screen.dart';
import 'package:ailment_alleviate/layers/presentation/pages/role_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../layers/presentation/pages/emperis_screen.dart';
import '../layers/presentation/pages/recipe_screen.dart';
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
          pageBuilder: (context, state) => slideTransitionRL(
            const RoleScreen(),
          ),
        ),
        GoRoute(
          path: 'home',
          name: 'home',
          pageBuilder: (context, state) => slideTransitionRL(
            const HomeScreen(),
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
        GoRoute(
          path: 'maker',
          name: 'maker',
          pageBuilder: (context, state) => slideTransitionRL(
            const MakerScreen(),
          ),
        ),
        GoRoute(
          path: 'add-med',
          name: 'add-med',
          pageBuilder: (context, state) => slideTransitionRL(
            const AddMedScreen(),
          ),
        ),
        GoRoute(
          path: 'add-ingredient',
          name: 'add-ingredient',
          pageBuilder: (context, state) => slideTransitionRL(
            const AddIngredientScreen(),
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
