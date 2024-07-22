import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:rentee/config/shared/preferences.dart';
import 'package:rentee/firebase_options.dart';
import 'package:rentee/presentation/screens/auth/auth_provider.dart';
import 'package:rentee/presentation/screens/home/room_provider.dart';
import 'package:rentee/rentee_main.dart';
import 'package:uikit/uikit.dart';

GlobalKey<NavigatorState> navigationStateKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Preferences.sharedPreferences();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthCustomProvider()),
          ChangeNotifierProvider(create: (_) => RoomProvider()),
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
