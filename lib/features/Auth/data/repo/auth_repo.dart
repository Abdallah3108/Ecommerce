import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/network/api_helper.dart';
import 'package:ecommerceapp/core/network/api_response.dart';
import 'package:ecommerceapp/features/Auth/data/models/user_model.dart';

class AuthRepo {
  // Singleton
  static final AuthRepo _instance = AuthRepo._internal();

  factory AuthRepo() => _instance;

  AuthRepo._internal();
  ApiHelper apiHelper=ApiHelper();

  // UserModel? user;

  Future<Either<String, String>> register({required String name, required String phone, required String email, required String password }) async {
    try {
      ApiResponse aPiResponse = await apiHelper.postRequest(
          endPoint: 'register',
          data: {
            'name': name,
            'phone': phone,
            'email': email,
            'password': password,
          },
          isAuthorized: false
      );
      if (aPiResponse.status) {
        return right(aPiResponse.message);
      }
      else {
        return left(aPiResponse.message);
      }
    } catch (e) {
      return left(ApiResponse
          .fromError(e)
          .message);
    }
  }

  Either<String, UserModel> login({
    required String email,
    required String password,
  }) {
    try {

          return Right(UserModel(email: 'email', password: 'password', name: 'name', phone: 'phone'));
      //   } else {
      //     throw Exception('Invalid email or password');
      //   }
      // } else {
      //   throw Exception('You must register first');
      // }
    } catch (e) {
      return left(e.toString());
    }
  }
}
