import 'package:clean_arch_flutter/core/network/dio_client.dart';
import 'package:clean_arch_flutter/data/datasources/auth/auth_service.dart';
import 'package:clean_arch_flutter/data/repositories/auth/auth.dart';
import 'package:clean_arch_flutter/domain/repositories/auth/auth.dart';
import 'package:clean_arch_flutter/domain/usecases/auth/signin.dart';
import 'package:clean_arch_flutter/domain/usecases/auth/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  sl.registerSingleton<IAuthService>(AuthServiceMock());

  sl.registerSingleton<IAuthRepository>(
    AuthRepository(authService: sl<IAuthService>()),
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(authRepository: sl<IAuthRepository>()),
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(authRepository: sl<IAuthRepository>()),
  );
}
