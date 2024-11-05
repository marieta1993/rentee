import 'package:flutter/material.dart';
import 'package:rentee/presentation/screens/auth/sign_in/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uikit/uikit.dart';
import 'package:rentee/domain/models/onboarding_data/onboarding_data_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  late bool _isLastPage;
  late bool _isFirstPage;

  final pagesData = [
    OnboardingData(
        title: "Choose from a thousand of places",
        description:
            "We provide you with a variant of accommodation for a better choice",
        img: RenteeAssets.images.onboarding1.provider()),
    OnboardingData(
        title: "Well-selected accommodation",
        description:
            "We provide you with a variant of accommodation for a better choice",
        img: RenteeAssets.images.onboarding2.provider()),
    OnboardingData(
        title: "Cool and secure service",
        description:
            "We provide you with a variant of accommodation for a better choice",
        img: RenteeAssets.images.onboarding3.provider()),
  ];

  @override
  void initState() {
    _isLastPage = false;
    _isFirstPage = true;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    pagesData.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      pagesData.length,
      (index) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: pagesData[index].img,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: roundedContainerTop30,
                padding: paddingAll48,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pagesData[index].title,
                      style: onboardingH,
                    ),
                    Padding(
                      padding: paddingV16,
                      child: onboardingDivider,
                    ),
                    Text(
                      pagesData[index].description,
                      style: notoP2,
                    ),
                    Center(
                      child: Padding(
                          padding: paddingV16,
                          child: RenteePageIndicator(
                            pagesData: pagesData,
                            index: index,
                            controller: _controller,
                          )),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        !_isFirstPage && !_isLastPage
                            ? Expanded(
                                child: RenteeElevatedButton.gray(
                                text: "Back",
                                onPress: () {
                                  onBackPress(index);
                                },
                              ))
                            : const SizedBox(),
                        // _isLastPage
                        //     ? Expanded(
                        //         child: RenteeElevatedButton(
                        //         text: "Sign up",
                        //         onPress: onSignUpPress,
                        //       ))
                        //     : const SizedBox(),
                        16.widthBox,
                        _isLastPage
                            ? Expanded(
                                child: RenteeElevatedButton(
                                text: "Sign in",
                                onPress: onSignInPress,
                              ))
                            : const SizedBox(),
                        !_isLastPage
                            ? Expanded(
                                child: RenteeElevatedButton(
                                  text: "Next",
                                  onPress: () {
                                    onNextPress(index);
                                  },
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
        body: PageView(
      onPageChanged: (index) {
        setState(() {
          _isFirstPage = index == 0;
          _isLastPage = index == pagesData.length - 1;
        });
      },
      controller: _controller,
      children: pages,
    ));
  }

  void onBackPress(index) {
    setState(() {
      _isFirstPage = index == 0;
      _isLastPage = index == pagesData.length - 1;
      _controller.jumpToPage(index - 1);
    });
  }

  Future<void> onSignInPress() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstLaunch', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SignInScreen()),
    );
  }

  Future<void> onSignUpPress() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstLaunch', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SignInScreen()),
    );
  }

  onNextPress(index) {
    if (index == pagesData.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignInScreen()),
      );
    } else {
      setState(() {
        _isFirstPage = index == 0;
        _isLastPage = index == pagesData.length - 1;
        _controller.jumpToPage(index + 1);
      });
    }
  }
}
