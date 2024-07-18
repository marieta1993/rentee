import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentee/controllers/auth_service.dart';
import 'package:rentee/presentation/screens/auth/auth_layout.dart';
import 'package:rentee/presentation/screens/auth/auth_provider.dart';
import 'package:rentee/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:rentee/presentation/screens/home/tab_main_screen.dart';
import 'package:uikit/uikit.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

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
              // const RenteeInputField(
              //   label: "Your code here",
              // ),
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
                    'Expired after 12s',
                    style: notoP3.copyWith(color: RenteeColors.additional3),
                  ),
                  InkWell(
                    child: Text(
                      'Resend',
                      style: notoH5.copyWith(color: RenteeColors.primary),
                    ),
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
                        .then((value) {
                      if (value == "Success") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignUpScreen()),
                        );
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (_) => const TabMainScreen()),
                        // );
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
