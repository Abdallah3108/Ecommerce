import 'package:ecommerceapp/core/constants/consts.dart';
import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/features/onboarding/views/skip_choose_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get_started_view.dart';






class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateBasedOnPrefs();


  }
  Future<void> navigateBasedOnPrefs() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final onboardingDone = prefs.getBool('onboarding_done') ?? true;

    if (onboardingDone) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStartedView()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SkipChooseProduct()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Center(
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.logo),
              const SizedBox(width: 10),
              Text(
                AppConstants.appName,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: AppColors.stylish,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

