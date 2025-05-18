import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/core/widgets/custom_started_button.dart';
import 'package:ecommerceapp/features/Auth/views/login.dart';
import 'package:ecommerceapp/features/Auth/views/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(AppAssets.getStarted, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(top: 492),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'You want\n Authentic, here\n you go!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Find it here, buy it now!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                    fontFamily: 'montserrat',
                  ),
                ),
                SizedBox(height: 20),
                CustomStartedButton(
                  text: 'Login',
                  textColor: AppColors.white,
                  backgroundColor: AppColors.stylish,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginView(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                CustomStartedButton(
                  text: 'Register',
                  textColor: AppColors.stylish,
                  backgroundColor: AppColors.white,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
