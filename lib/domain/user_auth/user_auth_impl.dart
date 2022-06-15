import 'user_auth_repository.dart';
import 'package:dartz/dartz.dart';
import '../../error/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuthImpl extends UserAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<Either<UserCredential, Failure>> signInUser(
      String email, String password) async {
    try {
      UserCredential user;

      user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return left(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "network-request-failed":
          return right(
              UserAuthFailure(errorMessage: "Oops, your connection seems off"));

        case "wrong-password":
          return right(
              UserAuthFailure(errorMessage: "Your email or password is wrong"));
        case "user-not-found":
          return right(
              UserAuthFailure(errorMessage: "Your email or password is wrong"));
        default:
          return right(UserAuthFailure(errorMessage: e.code));
      }
    }
  }

  @override
  Future<Either<UserCredential, Failure>> signUpUser(
      String email, String password) async {
    try {
      UserCredential user;

      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return left(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return right(UserAuthFailure(
              errorMessage: "this email adress is already in use"));

        case "network-request-failed":
          return right(
              UserAuthFailure(errorMessage: "Oops, your connection seems off"));

        default:
          return right(UserAuthFailure(errorMessage: e.code));
      }
    }
  }
}
