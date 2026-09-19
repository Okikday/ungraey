import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../client.dart';
import '../../features/account/auth/ui/screens/tester_sign_in_view.dart';
import '../../features/main/ui/screens/main_shell_view.dart';

/// Global declarative routing configuration using GoRouter.
final appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final isSignedIn = sessionManager.isSignedIn;
    final isGoingToLogin = state.uri.path == '/';

    if (isSignedIn && isGoingToLogin) {
      return '/home';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TesterSignInView();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const MainShellView();
      },
    ),
  ],
);
