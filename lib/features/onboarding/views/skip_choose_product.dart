import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/widgets/custom_onboarding.dart';
import 'package:ecommerceapp/features/onboarding/views/skip_make_payments.dart';
import 'package:flutter/material.dart';

class SkipChooseProduct extends StatelessWidget {
  const SkipChooseProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPage(
        imagePath: AppAssets.chooseProducts,
        title: 'Choose Products',
        description:
            'Amet minim mollit non deserunt ullamco est\n sit aliqua dolor do amet sint. Velit officia\n consequat duis enim velit mollit.',
        buttonRightText: 'Next',
        RightOnPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SkipMakePayments()),
          );
        },
      ),
    );
  }
}
