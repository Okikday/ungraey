import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import '../../../../../../client.dart';
import '../../../../../../shared/components/app_text.dart';
import '../../../../../../shared/theme/pure_theme_extension.dart';

class TesterSignInView extends StatelessWidget {
  const TesterSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Scaffold(
      backgroundColor: pure.scaffoldBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                'Ungraey Tester Login',
                style: TextStyle(
                  color: pure.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              AppText(
                'Please sign in to access the marketplace.',
                style: TextStyle(
                  color: pure.textSecondary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 32),
              SignInWithEmailButton(
                caller: client.modules.auth,
                onSignedIn: () {
                  context.go('/home');
                },
              ),
              const SizedBox(height: 12),
              AppText(
                'Demo Account: tester@ungraey.com / tester123',
                style: TextStyle(
                  color: pure.textMuted,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: pure.primary, width: 1.5),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  context.go('/home');
                },
                icon: Icon(Icons.bolt, color: pure.primary, size: 20),
                label: AppText(
                  'Bypass Login (Hackathon Demo)',
                  style: TextStyle(
                    color: pure.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
