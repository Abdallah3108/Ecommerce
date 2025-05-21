import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/network/api_helper.dart';
import 'package:ecommerceapp/core/network/api_response.dart';
import 'package:ecommerceapp/features/Auth/data/models/user_model.dart';

import '../../../../core/local/local_data.dart';


class AuthRepo {
  // Singleton
  static final AuthRepo _instance = AuthRepo._internal();

  factory AuthRepo() => _instance;

  AuthRepo._internal();
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
        endPoint: 'register',
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
        },
        isAuthorized: false,
      );
      if (apiResponse.status) {
        return right(apiResponse.message);
      } else {
        return left(apiResponse.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
        endPoint: 'login',
        data: {
          'email': email,
          'password': password,
        },
        isAuthorized: false,
      );

      if (apiResponse.status) {
        var data = apiResponse.data['user'];
        var accessToken = apiResponse.data['access_token'];


        await LocalData.setAccessToken(accessToken);

        final user = UserModel(
          email: data['email'],
          password: password,
          name: data['name'],
          phone: data['phone'],
        );
        return right(user);
      } else {
        return left(apiResponse.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }
}
