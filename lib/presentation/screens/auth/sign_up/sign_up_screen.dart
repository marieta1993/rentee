import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentee/presentation/screens/auth/auth_layout.dart';
import 'package:rentee/presentation/screens/auth/auth_provider.dart';
import 'package:rentee/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:rentee/presentation/screens/auth/verification/verification_screen.dart';
import 'package:rentee/presentation/screens/home/tab_main_screen.dart';
import 'package:rentee/utils/extensions/context_localization.dart';
import 'package:rentee/utils/validators/validators.dart';
import 'package:uikit/uikit.dart';

class SignUpScreen extends StatefulWidget with Validator {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Validator {
  @override
  Widget build(BuildContext context) {
    AuthLayoutData signUpData = AuthLayoutData(
      mainContent:
          Consumer<AuthCustomProvider>(builder: (context, provider, _) {
        return Form(
          key: provider.formSignUpKey,
          child: Column(
            children: [
              RenteeInputField(
                controller: provider.firstNameController,
                validator: fullNameValidation,
                placeholder: "Your first name",
                label: "E.g. John ",
              ),
              20.heightBox,
              RenteeInputField(
                controller: provider.lastNameController,
                validator: fullNameValidation,
                placeholder: "Your last name",
                label: "E.g. Smith",
              ),
              // RenteeInputField(
              //   validator: phoneNumberValidation,
              //   controller: provider.phoneNumberController,
              //   keyboardType: TextInputType.phone,
              //   placeholder: "Your phone number here",
              //   label: "Phone number",
              // ),
              // 20.heightBox,
              // RenteeInputField.password(
              //   controller: provider.passwordController,
              //   validator: passwordValidation,
              //   label: "Password",
              // ),
              // 20.heightBox,
              RenteeElevatedButton(
                text: "Next",
                onPress: () {
                  if (provider.formSignUpKey.currentState!.validate()) {
                    print("hiiiiiiiiiiiiiiiiiiiii");
                    provider.saveUserDetails();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TabMainScreen(),
                      ),
                    );
                  }
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
