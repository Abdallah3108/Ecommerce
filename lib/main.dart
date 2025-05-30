import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import 'core/local/local_data.dart';
import 'core/network/api_helper.dart';
import 'features/home/data/repo/product_repo.dart';
import 'features/home/manager/product_cubit/product_cubit.dart';
import 'features/onboarding/views/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  await LocalData.loadAccessToken();
  await LocalData.loadRefreshToken();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(
            repository: ProductsRepository(
              apiHelper: ApiHelper(),
            ),
          ),
        ),
      
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(), 
    );
  }
}
