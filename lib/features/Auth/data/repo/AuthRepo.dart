import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/features/Auth/data/models/user_model.dart';

class AuthRepo {
  // Singleton
  static final AuthRepo _instance = AuthRepo._internal();

  factory AuthRepo() => _instance;

  AuthRepo._internal();

  UserModel? user;

  Future<Either<String, void>> register({required UserModel user}) async {
    try {
      if (user.name.isEmpty || user.phone.isEmpty || user.email.isEmpty || user.password.isEmpty) {
        throw Exception('All fields are required');
      }
      this.user = user;
      await Future.delayed(Duration(milliseconds: 2000));
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  Either<String, UserModel> login({
    required String email,
    required String password,
  }) {
    try {
      if (user != null) {
        if (user!.email == email && user!.password == password) {
          return right(user!);
        } else {
          throw Exception('Invalid email or password');
        }
      } else {
        throw Exception('You must register first');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
