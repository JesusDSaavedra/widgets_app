import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          name: CardsScreen.name,
          path: 'cards',
          builder: (BuildContext context, GoRouterState state) {
            return const CardsScreen();
          },
        ),
        GoRoute(
          name: ButtonsScreen.name,
          path: 'buttons',
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonsScreen();
          },
        ),
        GoRoute(
          name: ProgressScreen.name,
          path: 'progress',
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressScreen();
          },
        ),
        GoRoute(
          name: SnackbarScreen.name,
          path: 'snackbars',
          builder: (BuildContext context, GoRouterState state) {
            return const SnackbarScreen();
          },
        ),
        GoRoute(
          name: AnimatedScreen.name,
          path: 'animated',
          builder: (BuildContext context, GoRouterState state) {
            return const AnimatedScreen();
          },
        ),
        GoRoute(
          name: UiControlsScreen.name,
          path: 'ui-controls',
          builder: (BuildContext context, GoRouterState state) {
            return const UiControlsScreen();
          },
        ),
        GoRoute(
          name: AppTutorialScreen.name,
          path: 'tutorial',
          builder: (BuildContext context, GoRouterState state) {
            return const AppTutorialScreen();
          },
        ),
      ],
    ),
  ],
);
