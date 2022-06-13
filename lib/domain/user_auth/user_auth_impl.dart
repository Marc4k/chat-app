import 'package:chat_app/domain/user_auth/user_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:chat_app/error/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuthImpl extends UserAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserCredential>> signUpUser(
      String email, String password) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(UserAuthFailure(errorMessage: "Same Email"));
    }
  }
}
