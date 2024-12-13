import 'package:flutter/material.dart';
import 'package:testt/src/configs/routes/slide_transition_page.dart';
import 'package:testt/src/features/account_verification/view/verify_shop_screen.dart';
import 'package:testt/src/features/auth/signup/view/signup_view_with_number.dart';
import 'package:testt/src/features/auth/update_n_forgot_password/view/forgot_password_screen.dart';
import 'package:testt/src/features/auth/update_n_forgot_password/view/setnew_password_screen.dart';
import 'package:testt/src/features/dashborad/view/dashboard.dart';
import 'package:testt/src/features/my_profile/view/delete_account_screen.dart';
import 'package:testt/src/features/my_profile/view/edit_profile_screen.dart';
import 'package:testt/src/features/notifications/notifications_screen.dart';
import 'package:testt/src/features/splash/view/select_langage_screen.dart';
import '../../features/account_verification/view/choose_ccount_type_screen.dart';
import 'routes_name.dart';
import '../../features/auth/login/view/login_view_with_number.dart';
import '../../features/splash/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
// splash
      case RoutesName.splash:
        return SlideTransitionPage(page: SplashScreen());
      case RoutesName.selectLanguageScreen:
        return SlideTransitionPage(page: const SelectLanguageScreen());

// signup
      case RoutesName.signupViewWithNumber:
        return SlideTransitionPage(page: const SignUpViewWithNumber());

// signin
      case RoutesName.loginViewWithNumber:
        return SlideTransitionPage(page: const LoginViewWithNumber());
      case RoutesName.forgotPassword:
        return SlideTransitionPage(page: const ForgetPasswordScreen());
      case RoutesName.setNewPasswordScreen:
        return SlideTransitionPage(page: const SetNewPasswordScreen());
      case RoutesName.chooseAccountScreen:
        return SlideTransitionPage(page: const ChooseAccountTypeScreen());

// shop verifucation
      case RoutesName.verifyShopScreen:
        return SlideTransitionPage(page: VerifyShopScreen());

//prifle
      case RoutesName.deleteaccount:
        return SlideTransitionPage(page: DeleteAccountScreen());

//home
      case RoutesName.dashboard:
        return SlideTransitionPage(page: Dashboard());
      case RoutesName.notificaiton:
        return SlideTransitionPage(page: NotificationScreen());
      case RoutesName.editProfile:
        return SlideTransitionPage(page: EditProfileScreen());

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
