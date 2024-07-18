import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentee/controllers/auth_service.dart';
import 'package:rentee/presentation/screens/auth/auth_layout.dart';
import 'package:rentee/presentation/screens/auth/auth_provider.dart';
import 'package:rentee/presentation/screens/auth/reset/reset_screen.dart';
import 'package:rentee/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:rentee/presentation/screens/auth/verification/verification_screen.dart';
import 'package:rentee/utils/extensions/context_localization.dart';
import 'package:rentee/utils/validators/validators.dart';
import 'package:uikit/uikit.dart';

class SignInScreen extends StatelessWidget with Validator {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthLayoutData signInData = AuthLayoutData(
      mainContent:
          Consumer<AuthCustomProvider>(builder: (context, provider, _) {
        return Form(
          key: provider.formSignInKey,
          child: Column(
            children: [
              RenteeInputField(
                controller: provider.phoneNumberController,
                validator: phoneNumberValidation,
                keyboardType: TextInputType.phone,
                placeholder: "E.g +37498123456",
                label: "Phone number",
              ),
              // 20.heightBox,
              // RenteeInputField.password(
              //   controller: provider.passwordController,
              //   validator: passwordValidation,
              //   label: "Password",
              // ),
              20.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  child: Text(
                    "Forgot you password",
                    style: notoH5.copyWith(color: RenteeColors.primary),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const ResetScreen()),
                    );
                  },
                ),
              ),
              20.heightBox,
              RenteeElevatedButton(
                text: "Sign in",
                onPress: () async {
                  // final prefs = await SharedPreferences.getInstance();
                  // prefs.setBool('firstLaunch', true);
                  if (provider.signInAction()) {
                    AuthService.sentOtp(
                      phone: int.parse(provider.phoneNumberController.text),
                      errorStep: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            "Error in sending Otp",
                            style: TextStyle(color: RenteeColors.white),
                          ),
                          backgroundColor: Colors.red,
                        ));
                      },
                      nextStep: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const VerificationScreen(),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              15.heightBox,
              RichText(
                  text: TextSpan(
                text: "Don’t have an account?",
                style: notoP3.copyWith(color: RenteeColors.additional3),
                children: <TextSpan>[
                  TextSpan(
                      text: " Sign up ",
                      style: notoH5.copyWith(color: RenteeColors.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignUpScreen(),
                            ),
                          );
                        }),
                ],
              )),
              15.heightBox,
            ],
          ),
        );
      }),
      img: RenteeAssets.images.frame.svg(width: 36),
      title: context.localized.rentee,
    );

    return AuthLayout(
      data: signInData,
    );
  }
}
