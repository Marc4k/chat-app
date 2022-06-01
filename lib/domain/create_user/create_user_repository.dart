import 'package:firebase_auth/firebase_auth.dart';

abstract class CreateUserRepository {
  Future<void> createUser(
      UserCredential user, String firstName, String lastname, String imgPath);
}
