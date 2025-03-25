import 'package:clean_arch_flutter/data/models/auth/signup_request_params.dart';
import 'package:clean_arch_flutter/domain/repositories/auth/auth.dart';
import 'package:clean_arch_flutter/domain/usecases/base.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase implements IUseCase<Either, SignupRequestParams> {
  final IAuthRepository authRepository;

  SignupUseCase({required this.authRepository});

  @override
  Future<Either> execute({SignupRequestParams? params}) async {
    return await authRepository.signUp(params!);
  }
}
