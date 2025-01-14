import 'package:doctor/core/routing/routes.dart';
import 'package:doctor/features/auth/login/ui/login_screen.dart';
import 'package:doctor/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generatrRoute(RouteSettings settings) {
    
    // This arguments to berr passed in any screen like this (arguments as ClassName)
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defiend for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
