import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_signal_flutter/login/login_screen.dart';
import 'package:one_signal_flutter/play_music_detail/play_music_detail_dashboard.dart';
import 'package:one_signal_flutter/splash/splash_screen.dart';

import 'dashboard/dashboard_screen.dart';

class AppRouter {
  static const String SPLASH_SCREEN = '/splash_screen';
  static const String LOGIN_SCREEN = '/login_screen';
  static const String DASHBOARD_SCREEN = '/dashboard_screen';
  static const String PLAY_MUSIC_DETAIL_DASHBOARD_SCREEN =
      '/play_music_detail_dashboard';
  static const String PLAY_MUSIC_DETAIL_DASHBOARD =
      '/play_music_detail_dashboard';

  Future<Widget> initialFirstScreen() async {
    return const SplashScreen();
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case DASHBOARD_SCREEN:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const DashboardScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.ease;
              var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case PLAY_MUSIC_DETAIL_DASHBOARD_SCREEN:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const PlayMusicDetailDashboardScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
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
