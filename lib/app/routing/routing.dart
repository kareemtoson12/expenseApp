import 'package:flutter/material.dart';
import '../../presentation/splash/splash_view.dart';
import '../../presentation/onboarding/onboarding_view.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case AppRoutes.home:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Home Screen'))),
      );
    case AppRoutes.onboarding:
      return MaterialPageRoute(builder: (_) => const OnboardingView());
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Unknown Route'))),
      );
  }
}
