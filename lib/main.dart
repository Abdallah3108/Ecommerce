import 'package:flutter/material.dart';
import 'package:ecommerceapp/features/onboarding/views/splash.dart';

import 'core/local/local_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalData.loadAccessToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
