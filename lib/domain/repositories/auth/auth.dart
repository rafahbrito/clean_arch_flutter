import 'package:clean_arch_flutter/data/models/auth/signin_request_params.dart';
import 'package:clean_arch_flutter/data/models/auth/signup_request_params.dart';
import 'package:dartz/dartz.dart';

abstract interface class IAuthRepository {
  Future<Either> signUp(SignupRequestParams params);
  Future<Either> signIn(SigninRequestParams params);
}
