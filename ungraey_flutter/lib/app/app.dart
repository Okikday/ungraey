import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../shared/theme/app_theme.dart';
import 'app_provider.dart';
import 'routes/app_router.dart';

/// Root application widget configuring Aura themes, Riverpod, and GoRouter.
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(AppPod.me.select((s) => s.themeMode));

    return MaterialApp.router(
      title: 'Ungraey',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: appRouter,
    );
  }
}
