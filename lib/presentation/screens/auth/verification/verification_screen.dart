import 'package:flutter/material.dart';
import 'package:rentee/presentation/screens/auth/auth_layout.dart';
import 'package:rentee/presentation/screens/home/tab_main_screen.dart';
import 'package:uikit/uikit.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthLayoutData verificationData = AuthLayoutData(
      mainContent: Form(
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
            const RenteePinPut(
              label: "Your code here",
            ),
            15.heightBox,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expried after 12s',
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const TabMainScreen()),
                );
              },
            ),
            15.heightBox,
          ],
        ),
      ),
      img: RenteeAssets.images.shieldDone.svg(width: 36),
      title: "Verify",
    );

    return AuthLayout(
      data: verificationData,
    );
  }
}
