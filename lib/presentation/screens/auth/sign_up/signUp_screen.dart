import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentee/presentation/screens/auth/auth_layout.dart';
import 'package:rentee/presentation/screens/auth/auth_provider.dart';
import 'package:rentee/presentation/screens/auth/sign_in/signIn_Screen.dart';
import 'package:rentee/presentation/screens/auth/verification/verification_screen.dart';
import 'package:rentee/utils/extensions/context_localization.dart';
import 'package:rentee/utils/validators/confirmPassword_validator.dart';
import 'package:rentee/utils/validators/fullName_validator.dart';
import 'package:rentee/utils/validators/password_validator.dart';
import 'package:rentee/utils/validators/phoneNumber_validator.dart';
import 'package:uikit/uikit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Validator {
  @override
  Widget build(BuildContext context) {
    AuthLayoutData signUpData = AuthLayoutData(
      mainContent: Consumer<AuthProvider>(builder: (context, provider, _) {
        return Form(
          key: provider.formSignUpKey,
          child: Column(
            children: [
              RenteeInputField(
                controller: provider.fullNameController,
                validator: fullNameValidation,
                placeholder: "Your full name",
                label: "E.g. John Smith",
              ),
              20.heightBox,
              RenteeInputField(
                validator: phoneNumberValidator,
                controller: provider.phoneNumberController,
                keyboardType: TextInputType.phone,
                placeholder: "Your phone number here",
                label: "Phone number",
              ),
              20.heightBox,
              RenteeInputField.password(
                controller: provider.passwordController,
                validator: passwordValidator,
                label: "Password",
              ),
              20.heightBox,
              RenteeInputField.password(
                validator: confirmPasswordValidator,
                controller: provider.retypePassword,
                label: 'Retype your password',
              ),
              20.heightBox,
              RenteeElevatedButton(
                text: "Sign up",
                onPress: () {
                  provider.signUpAction();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const VerificationScreen(),
                    ),
                  );
                },
              ),
              15.heightBox,
              RichText(
                  text: TextSpan(
                text: "Already have an account?",
                style: notoP3.copyWith(color: RenteeColors.additional3),
                children: <TextSpan>[
                  TextSpan(
                      text: " Sign in ",
                      style: notoH5.copyWith(color: RenteeColors.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignInScreen()),
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
      data: signUpData,
    );
  }
}
