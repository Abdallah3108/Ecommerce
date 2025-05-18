import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/core/widgets/custom_started_button.dart';
import 'package:ecommerceapp/core/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(AppAssets.arrowBack),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 32, right: 32),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome\nBack!',
                style: TextStyle(
                  fontFamily: 'montserrat',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomTextForm(hintText: "Email", prefixIcon: Icon(Icons.email)),
            SizedBox(height: 20),
            CustomTextForm(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.visibility_off),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: CustomStartedButton(
                backgroundColor: AppColors.stylish,
                text: 'Login',
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
