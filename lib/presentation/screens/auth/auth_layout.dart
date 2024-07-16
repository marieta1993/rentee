import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class AuthLayoutData {
  final String? title;
  final dynamic img;
  final Widget mainContent;
  const AuthLayoutData({
    this.title,
    this.img,
    required this.mainContent,
  });
}

class AuthLayout extends StatelessWidget {
  final AuthLayoutData data;

  const AuthLayout({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RenteeColors.additional1,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
                image: RenteeAssets.images.bottomBg1.provider())),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    data.img,
                    25.heightBox,
                    Text(
                      data.title ?? '',
                      style: notoH2.copyWith(color: RenteeColors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Padding(
                  padding: paddingAll32,
                  child: Container(
                    decoration: roundedContainerAll25,
                    padding: paddingAll24,
                    child: data.mainContent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
