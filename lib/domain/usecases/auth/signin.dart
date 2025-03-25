import 'package:clean_arch_flutter/data/models/auth/signin_request_params.dart';
import 'package:clean_arch_flutter/domain/repositories/auth/auth.dart';
import 'package:clean_arch_flutter/domain/usecases/base.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase implements IUseCase<Either, SigninRequestParams> {
  final IAuthRepository authRepository;

  SigninUseCase({required this.authRepository});

  @override
  Future<Either> execute({SigninRequestParams? params}) async {
    return await authRepository.signIn(params!);
  }
}
