import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/main/ui/screens/main_shell_view.dart';

/// Global declarative routing configuration using GoRouter.
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainShellView();
      },
    ),
  ],
);
