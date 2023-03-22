import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_signal_flutter/login/login_screen.dart';
import 'package:one_signal_flutter/splash/splash_screen.dart';

import 'dashboard/dashboard_screen.dart';

class AppRouter {
  static const String SPLASH_SCREEN = '/splash_screen';
  static const String LOGIN_SCREEN = '/login_screen';
  static const String DASHBOARD_SCREEN = '/dashboard_screen';

  Future<Widget> initialFirstScreen() async {
    return const SplashScreen();
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('Settings name: ${settings.name}');
    switch (settings.name) {
      case LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case DASHBOARD_SCREEN:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
