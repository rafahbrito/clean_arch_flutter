import 'package:clean_arch_flutter/data/models/auth/signin_request_params.dart';
import 'package:clean_arch_flutter/data/models/auth/signup_request_params.dart';
import 'package:dartz/dartz.dart';

abstract interface class IAuthService {
  Future<Either> signUp(SignupRequestParams params);
  Future<Either> signIn(SigninRequestParams params);
}

class AuthServiceMock implements IAuthService {
  final List<Map<String, dynamic>> _users = [
    {'email': 'admin@example.com', 'password': 'admin123'},
  ];

  @override
  Future<Either> signUp(SignupRequestParams params) async {
    if (_users.any((user) => user['email'] == params.email)) {
      return Left("Usuário já cadastrado!");
    }

    final newUser = params.toMap();
    _users.add(newUser);

    return Right(newUser.remove('password'));
  }

  @override
  Future<Either> signIn(SigninRequestParams params) async {
    final user = _users.firstWhere(
      (user) => user['email'] == params.email,
      orElse: () => {},
    );

    if (user.isEmpty) {
      return Left("Email não cadastrado!");
    }

    if (user['password'] != params.password) {
      return Left("Senha incorreta!");
    }

    return Right(user.remove('password'));
  }
}
