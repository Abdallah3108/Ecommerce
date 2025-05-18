import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/features/onboarding/views/skip_choose_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';   






class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SkipChooseProduct()),
      );
    });
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
                'Stylish',
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

 
