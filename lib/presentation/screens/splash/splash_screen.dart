import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rentee/presentation/screens/auth/sign_in/signIn_Screen.dart';
import 'package:rentee/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:rentee/utils/extensions/context_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uikit/uikit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool _firstLaunch;

  @override
  void initState() {
    super.initState();
    _loadPreferences();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                _firstLaunch ? const OnboardingScreen() : const SignInScreen(),
          ));
    });
  }

  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstLaunch = prefs.getBool('firstLaunch') ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RenteeColors.additional1,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            RenteeAssets.images.frame.svg(),
            25.heightBox,
            Text(
              context.localized.rentee,
              style: splashH,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
