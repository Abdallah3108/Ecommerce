import 'package:ecommerceapp/core/constants/consts.dart';
import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/widgets/custom_onboarding.dart';
import 'package:ecommerceapp/features/onboarding/views/get_started_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetOrderView extends StatelessWidget {
  const GetOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPage(
        imagePath: AppAssets.getOrder,
        title: 'Get Your Order',
        description: AppConstants.appTagLine,

        buttonRightText: 'Get Started',
        buttonLeftText: 'Previous',
        RightOnPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('onboarding_done', true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => GetStartedView()),
          );
        },
        LeftOnPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
