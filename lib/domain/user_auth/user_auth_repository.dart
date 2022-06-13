import 'package:chat_app/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserAuthRepository {
  Future<Either<Failure, UserCredential>> signUpUser(
      String email, String password);
  Future<UserCredential> loginUser(String email, String password);
}
