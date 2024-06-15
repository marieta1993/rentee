import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:rentee/presentation/screens/auth/auth_provider.dart';
import 'package:rentee/rentee_main.dart';
import 'package:uikit/uikit.dart';

GlobalKey<NavigatorState> navigationStateKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: MaterialApp(
            navigatorKey: navigationStateKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            title: 'Rentee',
            theme: lightTheme,
            locale: AppLocalizations.supportedLocales.first,
            home: const RenteeMain(title: 'Rentee')));
  }
}
