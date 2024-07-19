import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentee/controllers/auth_service.dart';
import 'package:rentee/presentation/screens/auth/auth_layout.dart';
import 'package:rentee/presentation/screens/auth/auth_provider.dart';
import 'package:rentee/presentation/screens/auth/user_details/user_details_screen.dart';
import 'package:rentee/presentation/screens/home/tab_main_screen.dart';
import 'package:uikit/uikit.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _timerDuration = 60; // 60 seconds countdown
  Timer? _timer;
  int _currentSeconds = 60;
  bool _isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _currentSeconds = _timerDuration;
    _isResendEnabled = false;
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentSeconds > 0) {
          _currentSeconds--;
        } else {
          _timer?.cancel();
          _isResendEnabled = true;
        }
      });
    });
  }

  void resendOtp(phone) {
    // Implement OTP resend logic here
    // For example, use Firebase Auth to send OTP again
    // FirebaseAuth.instance.verifyPhoneNumber(...);
    AuthService.sentOtp(
      phone: int.parse(phone),
      errorStep: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Error in sending Otp",
            style: TextStyle(color: RenteeColors.white),
          ),
          backgroundColor: Colors.red,
        ));
      },
      nextStep: () {},
    );

    // Restart the timer
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthLayoutData verificationData = AuthLayoutData(
      mainContent:
          Consumer<AuthCustomProvider>(builder: (context, provider, _) {
        return Form(
          key: provider.formVerifyKey,
          child: Column(
            children: [
              Text(
                "Please enter the verification code sent to your phone number",
                style: notoP2.copyWith(color: RenteeColors.additional3),
                textAlign: TextAlign.center,
              ),
              25.heightBox,
              RenteePinPut(
                label: "Your code here",
                controller: provider.otpCodeController,
              ),
              15.heightBox,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Expired after $_currentSeconds s',
                    style: notoP3.copyWith(color: RenteeColors.additional3),
                  ),
                  InkWell(
                    child: Text(
                      'Resend',
                      style: notoH5.copyWith(color: RenteeColors.primary),
                    ),
                    onTap: () {
                      _isResendEnabled
                          ? resendOtp(provider.phoneNumberController.text)
                          : null;
                    },
                    // onTap: () {
                    // },
                  )
                ],
              ),
              15.heightBox,
              RenteeElevatedButton(
                text: "Confirm",
                onPress: () {
                  if (provider.formVerifyKey.currentState!.validate()) {
                    AuthService.loginWithOtp(
                            otp: provider.otpCodeController.text)
                        .then((value) async {
                      if (value == "Success") {
                        var phoneExist =
                            await provider.checkPhoneNumberExists();
                        if (phoneExist) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const TabMainScreen()),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const UserDetailsScreen()),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            value,
                            style: const TextStyle(color: RenteeColors.white),
                          ),
                          backgroundColor: Colors.red,
                        ));
                      }
                    });
                  }
                },
              ),
              15.heightBox,
            ],
          ),
        );
      }),
      img: RenteeAssets.images.shieldDone.svg(width: 36),
      title: "Verify",
    );

    return AuthLayout(
      data: verificationData,
    );
  }
}
