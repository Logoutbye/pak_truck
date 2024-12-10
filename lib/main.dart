import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:testt/src/features/splash/view_model/local_provider.dart';
import 'src/repository/auth_api/auth_http_api_repository.dart';
import 'src/repository/auth_api/auth_repository.dart';
import 'src/repository/home_api/home_http_api_repository.dart';
import 'src/repository/home_api/home_repository.dart';
import 'src/configs/theme/state.dart';
import 'src/features/home/view_model/home_view_model.dart';
import 'src/features/auth/view_model/login_view_model.dart';
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
  getIt.registerLazySingleton<HomeRepository>(() => HomeHttpApiRepository());
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
            create: (_) => HomeViewViewModel(homeRepository: getIt())),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: (BuildContext context, themeProvider, localeProvider,
            Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeProvider.themeData,
            locale: localeProvider.locale, // Set the app's locale
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('ur'), // Urdu
            ],
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
