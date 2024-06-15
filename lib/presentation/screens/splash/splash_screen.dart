import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rentee/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:rentee/utils/extensions/context_localization.dart';
import 'package:uikit/uikit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const OnboardingScreen(),
          ));
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
