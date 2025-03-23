import 'package:dartz/dartz.dart';

abstract interface class IAuthRepository {
  Future<Either> signUp();
}
