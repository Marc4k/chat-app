import 'package:chat_app/domain/user_auth/user_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuthImpl extends UserAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signUpUser(String email, String password) async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return user;
  }
}
