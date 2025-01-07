import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:testt/languages/I10n/l10n.dart';
import 'package:testt/src/features/account_completion/view_model/complete_account_view_model.dart';
import 'package:testt/src/features/account_verification/view_model/verify_individual_view_model.dart';
import 'package:testt/src/features/account_verification/view_model/verify_shop_view_model.dart';
import 'package:testt/src/features/auth/signup/view_model/signup_viewmodel.dart';
import 'package:testt/src/features/dashborad/view_model/navigation_provider.dart';
import 'package:testt/src/features/home/view_model/category_tab_index_notifier.dart';
import 'package:testt/src/features/home/view_model/new_tab_bar_notifier.dart';
import 'package:testt/src/features/my_profile/view_model/edit_profile_view_model.dart';
import 'package:testt/src/features/sell/view_model/sell_spare_parts_view_model.dart';
import 'package:testt/src/features/sell/view_model/sell_truck_view_model.dart';
import 'package:testt/src/features/splash/view_model/local_provider.dart';
import 'src/features/my_profile/view_model/profile_tabbar_provider.dart';
import 'src/repository/signup_api/signup_http_api_repository.dart';
import 'src/repository/signup_api/signup_repository.dart';
import 'src/configs/theme/state.dart';
import 'src/features/auth/login/view_model/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'src/configs/routes/routes.dart';
import 'src/configs/routes/routes_name.dart';

// creating an instance of GetIt
// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt
      .registerLazySingleton<SignUpRepository>(() => SignUpHttpApiRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(
            create: (_) => LoginViewModel(authRepository: getIt())),
        ChangeNotifierProvider(
            create: (_) => SignUpViewModel(signUpRepository: getIt())),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (_) => CompleteAccountViewModel(signUpRepository: getIt())),

        ChangeNotifierProvider(create: (_) => VerifyShopViewModel()),
        ChangeNotifierProvider(create: (_) => VerifyIndividualViewModel()),
        ChangeNotifierProvider(
            create: (_) => SignUpViewModel(signUpRepository: getIt())),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ProfileTabBarProvider()),
        ChangeNotifierProvider(create: (_) => EditProfileViewModel()),
        ChangeNotifierProvider(create: (_) => SellTuckViewModel()),
        ChangeNotifierProvider(create: (_) => SellSparePartsViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryTabIndexNotifier()),
        ChangeNotifierProvider(create: (_) => CustomTabBarNotifier()),
      ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: (BuildContext context, themeProvider, localeProvider,
            Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pak Truck',
            theme: themeProvider.themeData,
            locale: localeProvider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoute,
            // home: Dashboard(),
          );
        },
      ),
    );
  }
}
