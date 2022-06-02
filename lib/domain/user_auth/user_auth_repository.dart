import 'package:firebase_auth/firebase_auth.dart';

abstract class UserAuthRepository {
  Future<UserCredential> signUpUser(String email, String password);
  Future<UserCredential> loginUser(String email, String password);
}
