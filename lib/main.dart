import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:testt/languages/I10n/l10n.dart';
import 'package:testt/src/features/account_verification/view/verify_shop_screen.dart';
import 'package:testt/src/features/account_verification/view_model/verify_shop_view_model.dart';
import 'package:testt/src/features/dashborad/view/dashboard.dart';
import 'package:testt/src/features/dashborad/view_model/navigation_provider.dart';
import 'package:testt/src/features/my_profile/view/profile_screen.dart';
import 'package:testt/src/features/splash/view_model/local_provider.dart';
import 'src/features/my_profile/view_model/profile_tabbar_provider.dart';
import 'src/repository/auth_api/auth_http_api_repository.dart';
import 'src/repository/auth_api/auth_repository.dart';
import 'src/configs/theme/state.dart';
import 'src/features/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'src/configs/routes/routes.dart';
import 'src/configs/routes/routes_name.dart';

// creating an instance of GetIt
// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton<AuthRepository>(() => AuthHttpApiRepository());
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
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => VerifyShopViewModel()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ProfileTabBarProvider()),
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
