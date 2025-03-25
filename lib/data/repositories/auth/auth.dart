import 'package:clean_arch_flutter/data/datasources/auth/auth_service.dart';
import 'package:clean_arch_flutter/data/models/auth/signin_request_params.dart';
import 'package:clean_arch_flutter/data/models/auth/signup_request_params.dart';
import 'package:clean_arch_flutter/domain/repositories/auth/auth.dart';
import 'package:dartz/dartz.dart';

class AuthRepository implements IAuthRepository {
  IAuthService authService;

  AuthRepository({required this.authService});

  @override
  Future<Either> signUp(SignupRequestParams params) async {
    return authService.signUp(params);
  }

  @override
  Future<Either> signIn(SigninRequestParams params) async {
    return authService.signIn(params);
  }
}
