import 'package:flutter/material.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/features/splash/view/select_langage_screen.dart';
import 'routes_name.dart';
import '../../features/home/view/home_view.dart';
import '../../features/auth/view/login_view.dart';
import '../../features/splash/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return SlideTransitionPage(page: SplashScreen());
      case RoutesName.selectLanguageScreen:
        return SlideTransitionPage(page: const SelectLanguageScreen());

      case RoutesName.login:
        return SlideTransitionPage(page: const LoginView());

      case RoutesName.home:
        return SlideTransitionPage(page: const HomeView());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
