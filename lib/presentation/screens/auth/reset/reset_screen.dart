import 'package:flutter/material.dart';
import 'package:rentee/presentation/screens/auth/auth_layout.dart';
import 'package:uikit/uikit.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthLayoutData resetData = AuthLayoutData(
      mainContent: Form(
        child: Column(
          children: [
            Text(
              " We will send a code to your phone to reset your password.",
              style: notoP2.copyWith(color: RenteeColors.additional3),
              textAlign: TextAlign.center,
            ),
            25.heightBox,
            const RenteeInputField(
              placeholder: "Your phone number here",
              label: "Phone number",
            ),
            15.heightBox,
            const RenteeElevatedButton(text: "Send code"),
            15.heightBox,
          ],
        ),
      ),
      img: RenteeAssets.images.shieldDone.svg(width: 36),
      title: "Reset your password",
    );

    return AuthLayout(
      data: resetData,
    );
  }
}
