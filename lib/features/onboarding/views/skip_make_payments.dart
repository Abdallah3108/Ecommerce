import 'package:ecommerceapp/core/constants/consts.dart';
import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/widgets/custom_onboarding.dart';
import 'package:ecommerceapp/features/onboarding/views/skip_get_order.dart';
import 'package:flutter/material.dart';

class SkipMakePayments extends StatelessWidget {
  const SkipMakePayments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPage(
        imagePath: AppAssets.makePayments,
        title: 'Make Payment',
        description:
            AppConstants.appTagLine,
        buttonRightText: 'Next',
        RightOnPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GetOrderView()),
          );
        },
        buttonLeftText: 'Previous',
        LeftOnPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
