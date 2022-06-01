import 'package:chat_app/domain/user_auth/phone_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthRepositoryImpl extends PhoneAuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<void> logUserInWithPhone(String phoneNumber) async {
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (error) {},
        codeSent: (phone, code) {
          print(code);
        },
        codeAutoRetrievalTimeout: (test) {});
  }
}
