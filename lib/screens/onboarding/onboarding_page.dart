import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gohome/core/constants/colors.dart';
import 'package:gohome/core/extensions/context_extension.dart';
import 'package:gohome/screens/widgets/elevated_button_widget.dart';

class OnBoardingPAge extends StatelessWidget {
  const OnBoardingPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          width: context.width,
          padding: const EdgeInsets.all(35.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Onboarding.png'))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "onboardinglets".tr(),
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: ColorConst.kBottomNavigationColor),
              ),
              const Spacer(),
              MyElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                text: "getstarted".tr(),
                width: context.width,
                height: context.height * 0.06,
              )
            ],
          ),
        ),
      ),
    );
  }
}
