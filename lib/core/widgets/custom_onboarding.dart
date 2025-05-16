import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:ecommerceapp/features/onboarding/views/get_started_view.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String buttonRightText;
  final String? buttonLeftText;
  final VoidCallback RightOnPressed;
  final VoidCallback? LeftOnPressed;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonRightText,
    required this.RightOnPressed,
    this.LeftOnPressed,
    this.buttonLeftText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const GetStartedView(),
                      ),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontFamily: 'montserrat',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              SvgPicture.asset(
                imagePath,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.36,
              ),
              const SizedBox(height: 30),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                  fontFamily: 'montserrat',
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontFamily: 'montserrat',
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.19),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (LeftOnPressed != null)
                    TextButton(
                      onPressed: LeftOnPressed,
                      child: Text(
                        buttonLeftText ?? 'Previous',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey,
                          fontFamily: 'montserrat',
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                  TextButton(
                    onPressed: RightOnPressed ,
                    child: Text(
                      buttonRightText,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.stylish,
                        fontFamily: 'montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
