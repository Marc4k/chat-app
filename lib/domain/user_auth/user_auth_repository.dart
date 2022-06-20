import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../error/failures.dart';

abstract class UserAuthRepository {
  Future<Either<UserCredential, Failure>> signUpUser(
      String email, String password);
  Future<Either<UserCredential, Failure>> signInUser(
      String email, String password);

  Future<void> signOutUser();
}
